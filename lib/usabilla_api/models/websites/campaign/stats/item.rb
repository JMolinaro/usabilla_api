module UsabillaApi
  module Models
    module Websites
      module Campaign
        module Stats
          class Item
            attr_accessor :id, :completed, :conversion, :views

            def initialize(args = {})
              @id               = args['id']          || ''
              @completed        = args['completed']   || nil
              @conversion       = args['conversion']  || nil
              @views            = args['views']       || nil
            end

          end
        end
      end
    end
  end
end