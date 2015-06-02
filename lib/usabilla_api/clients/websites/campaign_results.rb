module UsabillaApi
  module Clients
    module Websites
      class CampaignResults
        class << self

          def retrieve(params)
            request = UsabillaApi.api_client.new(params).request(UsabillaApi.configuration.uri_websites_campaign_results, true)
            response = UsabillaApi.response.new(request)
            response.items = response.items.map {|item| UsabillaApi::Models::Websites::Campaign::Results::Item.new(item)} unless response.items.nil?
            response
          end

        end
      end
    end
  end
end