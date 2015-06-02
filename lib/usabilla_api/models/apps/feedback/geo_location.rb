module UsabillaApi
  module Models
    module Apps
      module Feedback
        class GeoLocation
          attr_accessor :city, :country, :lat, :lon, :region

          def initialize(args = {})
            @city      = args['city']      || ''
            @country   = args['country']   || ''
            @lat       = args['lat']       || nil
            @lon       = args['lon']       || nil
            @region    = args['region']    || ''
          end

        end
      end
    end
  end
end