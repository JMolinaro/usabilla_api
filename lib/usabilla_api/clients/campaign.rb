module UsabillaApi
  module Clients
    class Campaign
      class << self

        def retrieve(params)
          request = UsabillaApi.api_client.new(params).get_campaigns
          response = UsabillaApi.response.new(request)
          response.items = response.items.map {|item| UsabillaApi::Models::Campaign::Item.new(item)} unless response.items.nil?
          response
        end

        def results(params)
          request = UsabillaApi.api_client.new(params).get_campaign_results
          response = UsabillaApi.response.new(request)
          response.items = response.items.map {|item| UsabillaApi::Models::CampaignResults::Item.new(item)} unless response.items.nil?
          response
        end

      end
    end
  end
end