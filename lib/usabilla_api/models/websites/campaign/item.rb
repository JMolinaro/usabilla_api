module UsabillaApi
  module Models
    module Websites
      module Campaign
        class Item
          attr_accessor :id, :date, :button_id, :analytics_id, :status, :name, :type

          def initialize(args = {})
            @id             = args['id']          || ''
            @date           = args['date']        || ''
            @button_id      = args['buttonId']    || ''
            @analytics_id   = args['analyticsId'] || ''
            @status         = args['status']      || ''
            @name           = args['name']        || ''
            @type           = args['type']        || ''
          end

        end
      end
    end
  end
end