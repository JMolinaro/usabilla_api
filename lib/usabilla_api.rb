require 'rest-client'
require 'openssl'

module Usabilla
  Credentials = Struct.new(:client_key, :secret_key)

  class APIClient
    attr_accessor :method, :host, :host_protocol, :query_parameters, :credentials

    def initialize(client_key, secret_key, params)
      @method = 'GET'
      @host = 'data.usabilla.com'
      @host_protocol = 'https://'
      @query_parameters = params
      @credentials = Usabilla::Credentials.new(client_key, secret_key)
    end

    def send_signed_request(scope)

      if @credentials.client_key.nil? || @credentials.secret_key.nil?
          raise 'Invalid Access Key. The Access Key supplied is invalid.'
      end

      t = DateTime.now
      usbldate = t.strftime('%a, %d %b %Y %H:%M:%S GMT')
      datestamp = t.strftime('%Y%m%d')  # Date w/o time, used in credential scope
      long_date = t.strftime('%Y%m%dT%H%M%SZ')

      canonical_uri = scope
      canonical_querystring = @query_parameters
      canonical_headers = "date:#{usbldate}\nhost:#{@host}\n"
      signed_headers = 'date;host'
      payload_hash = OpenSSL::Digest::SHA256.new.hexdigest

      canonical_request = "#{@method}\n#{canonical_uri}\n#{canonical_querystring}\n#{canonical_headers}\n#{signed_headers}\n#{payload_hash}"

      canonical_request_digest = OpenSSL::Digest::SHA256.new(canonical_request).hexdigest
      algorithm = 'USBL1-HMAC-SHA256'
      credential_scope = "#{datestamp}/usbl1_request"

      string_to_sign = "#{algorithm}\n#{long_date}\n#{credential_scope}\n#{canonical_request_digest}"

      signing_key = get_signature_key(@credentials.secret_key, datestamp)
      signature = OpenSSL::HMAC.hexdigest('sha256', signing_key, string_to_sign)

      authorization_header = "#{algorithm} Credential=#{@credentials.client_key}/#{credential_scope}, SignedHeaders=#{signed_headers}, Signature=#{signature}"
      headers = {'date' => usbldate, 'Authorization' => authorization_header}

      # Send the request.
      request_url = @host + scope + '?' + canonical_querystring
      response = RestClient.get(@host_protocol + request_url, headers)
      print "#{request_url}"
      response

    end

    def get_signature_key(key, long_date)
      k_date    = OpenSSL::HMAC.digest('sha256', 'USBL1' + key, long_date)
      k_signing = OpenSSL::HMAC.digest('sha256', k_date, 'usbl1_request')
      k_signing
    end

    def get_buttons
      send_signed_request('/live/website/button')
    end

    def get_feedback_items(button_id='%2A')
      if button_id.nil? || button_id.empty?
          raise 'Invalid button ID'
      end
      if button_id == '*'
          button_id = '%2A'
      end
      feedback_items = send_signed_request("/live/website/button/#{button_id}/feedback")
      feedback_items

    end

    def get_campaigns
      send_signed_request('/live/website/campaign')
    end

    def get_campaign_results(campaign_id=nil)

      if campaign_id.nil? || campaign_id.empty?
          raise 'Invalid campaign ID'
      end

      campaign_results = send_signed_request("/live/website/campaign/#{campaign_id}/results")
      campaign_results

    end

  end
end
