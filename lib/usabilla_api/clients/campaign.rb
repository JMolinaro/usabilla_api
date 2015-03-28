require 'json'

module UsabillaApi
  module Clients
    class Campaign
      class << self

        def retrieve(params)
          request = UsabillaApi.api_client.new(params).get_campaigns
          request = UsabillaApi.response.new(JSON.parse(request)).campaign unless return_json_response
          request
        end

        def results(params)
          request = UsabillaApi.api_client.new(params).get_campaign_results
          request = UsabillaApi.response.new(JSON.parse(request)).campaign_results unless return_json_response
          request
        end

        private

        def return_json_response
          UsabillaApi.configuration.json_response
        end

      end
    end
  end
end