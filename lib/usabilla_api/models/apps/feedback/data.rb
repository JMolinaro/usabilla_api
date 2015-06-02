module UsabillaApi
  module Models
    module Apps
      module Feedback
        class Data
          attr_accessor :name, :nps, :rating, :speed, :subject

          def initialize(args = {})
            @name       = args['name']      || ''
            @nps        = args['nps']       || nil
            @rating     = args['rating']    || nil
            @speed      = args['speed']     || nil
            @subject    = args['subject']   || ''
          end

        end
      end
    end
  end
end