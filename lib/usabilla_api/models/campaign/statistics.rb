module UsabillaApi
  module Models
    module Campaign
      class Statistics

        attr_accessor :views, :completed, :conversion

        def initialize(args = {})
          @views            = args['views'] || nil
          @completed        = args['completed'] || nil
          @conversion       = args['conversion'] || nil
        end

      end
    end
  end
end