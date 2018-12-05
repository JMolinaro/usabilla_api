require 'rest-client'
require 'openssl'
require 'json'
require 'date'
require 'active_support/core_ext/hash/indifferent_access'

module UsabillaApi

  class Client
    attr_accessor :http_method, :host, :host_protocol, :access_key, :secret_key, :query_parameters

    def initialize(params)
      @http_method        = UsabillaApi.configuration.http_method
      @host_protocol      = UsabillaApi.configuration.host_protocol
      @host               = UsabillaApi.configuration.host
      @base_scope         = UsabillaApi.configuration.base_scope
      @access_key         = UsabillaApi.configuration.access_key || params.with_indifferent_access['access_key']
      @secret_key         = UsabillaApi.configuration.secret_key || params.with_indifferent_access['secret_key']
      @query_id           = params.with_indifferent_access['id']       || String.new
      @query_limit        = params.with_indifferent_access['limit']    || String.new
      @query_since        = params.with_indifferent_access['since']    || String.new
      @query_days_ago     = params.with_indifferent_access['days_ago'] || nil
    end

    def request(uri, require_id=false)
      base_uri = uri

      if @access_key.nil? || @secret_key.nil?
        raise 'The Access Key or Secret Key supplied is invalid.'
      end

      if require_id
        if @query_id.nil? || @query_id.empty?
          raise 'Invalid ID Parameter'
        else
          base_uri = sub_query_id(uri)
        end
      end

      t = DateTime.now
      usbldate = t.strftime('%a, %d %b %Y %H:%M:%S GMT')
      datestamp = t.strftime('%Y%m%d')  # Date w/o time, used in credential scope
      long_date = t.strftime('%Y%m%dT%H%M%SZ')

      query_string = "limit=#{@query_limit}&since=#{get_since_timestamp}"
      canonical_headers = "date:#{usbldate}\nhost:#{@host}\n"
      signed_headers = 'date;host'
      payload_hash = OpenSSL::Digest::SHA256.new.hexdigest

      canonical_request = "#{@http_method}\n#{@base_scope + base_uri}\n#{query_string}\n#{canonical_headers}\n#{signed_headers}\n#{payload_hash}"

      canonical_request_digest = OpenSSL::Digest::SHA256.new(canonical_request).hexdigest
      algorithm = 'USBL1-HMAC-SHA256'
      credential_scope = "#{datestamp}/usbl1_request"

      string_to_sign = "#{algorithm}\n#{long_date}\n#{credential_scope}\n#{canonical_request_digest}"

      signing_key = get_signature_key(@secret_key, datestamp)
      signature = OpenSSL::HMAC.hexdigest('sha256', signing_key, string_to_sign)

      authorization_header = "#{algorithm} Credential=#{@access_key}/#{credential_scope}, SignedHeaders=#{signed_headers}, Signature=#{signature}"
      headers = {'date' => usbldate, 'Authorization' => authorization_header}

      # Send the request.
      request_url = base_uri + '?' + query_string
      response = JSON.parse(RestClient.get(UsabillaApi.configuration.base_uri + request_url, headers))

      # Return Response
      response

    end

    private

    def get_signature_key(key, long_date)
      k_date    = OpenSSL::HMAC.digest('sha256', 'USBL1' + key, long_date)
      k_signing = OpenSSL::HMAC.digest('sha256', k_date, 'usbl1_request')
      k_signing
    end

    def sub_query_id(uri)
      uri.gsub(':id', CGI.escape(@query_id))
    end

    def since_filter(amount)
      date_now = DateTime.now.new_offset(0)
      date_ago = date_now - amount.to_i
      (date_ago.to_time.to_f * 1000).to_i
    end

    def get_since_timestamp
      @query_days_ago ? since_filter(@query_days_ago) : @query_since
    end
  end
end
