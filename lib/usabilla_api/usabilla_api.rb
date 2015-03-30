require 'rest-client'
require 'openssl'

module UsabillaApi

  class Client
    attr_accessor :http_method, :host, :host_protocol, :access_key, :secret_key, :query_parameters

    def initialize(params)
      @http_method        = UsabillaApi.configuration.http_method
      @host_protocol      = UsabillaApi.configuration.host_protocol
      @host               = UsabillaApi.configuration.host
      @base_scope         = UsabillaApi.configuration.base_scope
      @access_key         = UsabillaApi.configuration.access_key
      @secret_key         = UsabillaApi.configuration.secret_key
      @query_parameters   = params || ''
      @query_id           = @query_parameters["id"] || String.new
    end

    def get_buttons
      send_signed_request(UsabillaApi.configuration.uri_button)
    end

    def get_feedback_items
      if @query_id.nil? || @query_id.empty?
        raise 'Invalid Button ID'
      end
      uri = sub_query_id(UsabillaApi.configuration.uri_feedback_items)
      send_signed_request(uri)
    end

    def get_campaigns
      send_signed_request(UsabillaApi.configuration.uri_campaign)
    end

    def get_campaign_results
      if @query_id.nil? || @query_id.empty?
        raise 'Invalid Campaign ID'
      end
      uri = sub_query_id(UsabillaApi.configuration.uri_campaign_results)

      send_signed_request(uri)
    end

    private

    def send_signed_request(uri)

      if @access_key.nil? || @secret_key.nil?
        raise 'The Access Key or Secret Key supplied is invalid.'
      end

      t = DateTime.now
      usbldate = t.strftime('%a, %d %b %Y %H:%M:%S GMT')
      datestamp = t.strftime('%Y%m%d')  # Date w/o time, used in credential scope
      long_date = t.strftime('%Y%m%dT%H%M%SZ')

      query_string = "limit=#{@query_parameters['limit']}&since=#{@query_parameters['since']}"
      canonical_headers = "date:#{usbldate}\nhost:#{@host}\n"
      signed_headers = 'date;host'
      payload_hash = OpenSSL::Digest::SHA256.new.hexdigest

      canonical_request = "#{@http_method}\n#{@base_scope + uri}\n#{query_string}\n#{canonical_headers}\n#{signed_headers}\n#{payload_hash}"

      canonical_request_digest = OpenSSL::Digest::SHA256.new(canonical_request).hexdigest
      algorithm = 'USBL1-HMAC-SHA256'
      credential_scope = "#{datestamp}/usbl1_request"

      string_to_sign = "#{algorithm}\n#{long_date}\n#{credential_scope}\n#{canonical_request_digest}"

      signing_key = get_signature_key(@secret_key, datestamp)
      signature = OpenSSL::HMAC.hexdigest('sha256', signing_key, string_to_sign)

      authorization_header = "#{algorithm} Credential=#{@access_key}/#{credential_scope}, SignedHeaders=#{signed_headers}, Signature=#{signature}"
      headers = {'date' => usbldate, 'Authorization' => authorization_header}

      # Send the request.
      request_url = uri + '?' + query_string
      response = RestClient.get(UsabillaApi.configuration.base_uri + request_url, headers)

      # Return Response
      response

    end

    def get_signature_key(key, long_date)
      k_date    = OpenSSL::HMAC.digest('sha256', 'USBL1' + key, long_date)
      k_signing = OpenSSL::HMAC.digest('sha256', k_date, 'usbl1_request')
      k_signing
    end

    def sub_query_id(uri)
      uri.gsub(':id', @query_id)
    end

  end
end
