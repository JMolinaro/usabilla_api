module UsabillaApi
  module Models
    module Campaign
      class Item
        attr_accessor :id, :date, :button_id, :analytics_id, :status, :name, :statistics, :type

        def initialize(args = {})
          @id             = args['id'] || ''
          @date           = args['date'] || ''
          @button_id      = args['buttonId'] || ''
          @analytics_id   = args['analyticsId'] || ''
          @status         = args['status'] || ''
          @name           = args['name'] || ''
          @statistics     = create_statistics(args['statistics']) || []
          @type           = args['type'] || ''
        end

        def create_statistics(hash)
          UsabillaApi::Models::Campaign::Statistics.new(hash)
        end
      end
    end
  end
end