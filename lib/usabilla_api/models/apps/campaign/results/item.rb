module UsabillaApi
  module Models
    module Apps
      module Campaign
        module Results
          class Item
            attr_accessor :id, :date, :campaign_id, :app_id, :data, :context, :metadata, :complete, :raw_data

            def initialize(args = {})
              @raw_data       = args.with_indifferent_access
              @id             = args.with_indifferent_access['id']          || ''
              @date           = args.with_indifferent_access['date']        || ''
              @campaign_id    = args.with_indifferent_access['campaignId']  || ''
              @app_id         = args.with_indifferent_access['appId']       || ''
              @data           = args.with_indifferent_access['data']        || {}
              @context        = args.with_indifferent_access['context']     || {}
              @metadata       = args.with_indifferent_access['metadata']    || {}              
              @complete       = args.with_indifferent_access['complete']    || ''
            end

          end

        end
      end
    end
  end
end
