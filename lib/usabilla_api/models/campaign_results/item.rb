module UsabillaApi
  module Models
    module CampaignResults
      class Item
        attr_accessor :id, :user_agent, :location, :date, :campaign_id, :custom_data, :data, :url, :time

        def initialize(args = {})
          @id             = args['id'] || ''
          @user_agent     = args['userAgent'] || ''
          @location       = args['location'] || ''
          @date           = args['date'] || ''
          @campaign_id    = args['campaignId'] || ''
          @custom_data    = args['customData'] || []
          @data           = args['data'] || []
          @url            = args['url'] || ''
          @time           = args['time'] || nil
        end

      end
    end
  end
end