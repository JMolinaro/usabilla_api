module UsabillaApi
  module Models
    module Websites
      module Campaign
        module Results
          class Item
            attr_accessor :id, :user_agent, :location, :date, :campaign_id, :custom, :data, :url, :time

            def initialize(args = {})
              @id             = args['id']          || ''
              @user_agent     = args['userAgent']   || ''
              @location       = args['location']    || ''
              @date           = args['date']        || ''
              @campaign_id    = args['campaignId']  || ''
              @custom         = args['custom']      || []
              @data           = args['data']        || []
              @url            = args['url']         || ''
              @time           = args['time']        || nil
            end

          end

        end
      end
    end
  end
end