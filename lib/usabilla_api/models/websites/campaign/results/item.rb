module UsabillaApi
  module Models
    module Websites
      module Campaign
        module Results
          class Item
            attr_accessor :id, :user_agent, :location, :date, :campaign_id, :custom, :data, :url, :time, :raw_data

            def initialize(args = {})
              @raw_data       = args.with_indifferent_access
              @id             = args.with_indifferent_access['id']          || ''
              @user_agent     = args.with_indifferent_access['userAgent']   || ''
              @location       = args.with_indifferent_access['location']    || ''
              @date           = args.with_indifferent_access['date']        || ''
              @campaign_id    = args.with_indifferent_access['campaignId']  || ''
              @custom         = args.with_indifferent_access['custom']      || []
              @data           = args.with_indifferent_access['data']        || []
              @url            = args.with_indifferent_access['url']         || ''
              @time           = args.with_indifferent_access['time']        || nil
            end

          end

        end
      end
    end
  end
end
