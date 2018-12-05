module UsabillaApi
  module Models
    module Websites
      module Campaign
        module Stats
          class Item
            attr_accessor :id, :completed, :conversion, :views

            def initialize(args = {})
              @id               = args.with_indifferent_access['id']          || ''
              @completed        = args.with_indifferent_access['completed']   || nil
              @conversion       = args.with_indifferent_access['conversion']  || nil
              @views            = args.with_indifferent_access['views']       || nil
            end

          end
        end
      end
    end
  end
end