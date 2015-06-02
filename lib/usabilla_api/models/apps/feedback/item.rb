module UsabillaApi
  module Models
    module Apps
      module Feedback
        class Item
          attr_accessor :id, :date, :timestamp, :device_name, :data, :custom, :app_id, :app_name, :app_version, :os_name,
                        :os_version, :location, :geo_location, :free_memory, :total_memory, :free_storage, :total_storage,
                        :screenshot, :screensize, :connection, :ip_address, :language, :orientation, :battery_level, :rooted

          def initialize(args = {})
            @id               = args['id']                                || ''
            @date             = args['date']                              || ''
            @timestamp        = args['timestamp']                         || ''
            @device_name       = args['deviceName']                        || ''
            @data             = add_data(args['data'])                    || []
            @custom           = args['custom']                            || []
            @app_id           = args['appId']                             || ''
            @app_name         = args['appName']                           || ''
            @app_version      = args['appVersion']                        || ''
            @os_name          = args['osName']                            || ''
            @os_version       = args['osVersion']                         || ''
            @location         = args['location']                          || ''
            @geo_location     = add_geo_location(args['geoLocation'])     || []
            @free_memory      = args['freeMemory']                        || nil
            @total_memory     = args['totalMemory']                       || nil
            @free_storage     = args['freeStorage']                       || nil
            @total_storage    = args['totalStorage']                      || nil
            @screenshot       = args['screenshot']                        || ''
            @screensize       = args['screensize']                        || ''
            @connection       = args['connection']                        || ''
            @ip_address       = args['ipAddress']                         || ''
            @language         = args['language']                          || ''
            @orientation      = args['orientation']                       || ''
            @battery_level    = args['batteryLevel']                      || nil
            @rooted           = args['rooted']                            || false
          end

          private

          def add_data(hash)
            hash.map{ |group| UsabillaApi::Models::Apps::Feedback::Data.new(group) } unless hash.nil?
          end
          def add_geo_location(hash)
            hash.map{ |group| UsabillaApi::Models::Apps::Feedback::GeoLocation.new(group) } unless hash.nil?
          end

        end
      end
    end
  end
end