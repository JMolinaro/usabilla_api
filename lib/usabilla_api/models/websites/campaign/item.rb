module UsabillaApi
  module Models
    module Websites
      module Campaign
        class Item
          attr_accessor :id, :date, :button_id, :analytics_id, :status, :name,
                        :type, :raw_data

          def initialize(args = {})
            @raw_data       = args.with_indifferent_access
            @id             = raw_data['id']          || ''
            @date           = raw_data['date']        || ''
            @button_id      = raw_data['buttonId']    || ''
            @analytics_id   = raw_data['analyticsId'] || ''
            @status         = raw_data['status']      || ''
            @name           = raw_data['name']        || ''
            @type           = raw_data['type']        || ''
          end

        end
      end
    end
  end
end
