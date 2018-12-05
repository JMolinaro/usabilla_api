module UsabillaApi
  module Models
    module Apps
      module Feedback
        class Item
          attr_accessor :id, :date, :timestamp, :device_name, :data, :custom, :app_id, :app_name, :app_version, :os_name,
                        :os_version, :location, :geo_location, :free_memory, :total_memory, :free_storage, :total_storage,
                        :screenshot, :screensize, :connection, :ip_address, :language, :orientation, :battery_level, :rooted,
                        :raw_data


          def initialize(args = {})
            @raw_data         = args.with_indifferent_access
            @id               = raw_data['id']                || ''
            @date             = raw_data['date']              || ''
            @timestamp        = raw_data['timestamp']         || ''
            @device_name      = raw_data['deviceName']        || ''
            @data             = raw_data['data']              || {}
            @custom           = raw_data['customData']        || {}
            @app_id           = raw_data['appId']             || ''
            @app_name         = raw_data['appName']           || ''
            @app_version      = raw_data['appVersion']        || ''
            @os_name          = raw_data['osName']            || ''
            @os_version       = raw_data['osVersion']         || ''
            @location         = raw_data['location']          || ''
            @geo_location     = raw_data['geoLocation']       || {}
            @free_memory      = raw_data['freeMemory']        || nil
            @total_memory     = raw_data['totalMemory']       || nil
            @free_storage     = raw_data['freeStorage']       || nil
            @total_storage    = raw_data['totalStorage']      || nil
            @screenshot       = raw_data['screenshot']        || ''
            @screensize       = raw_data['screensize']        || ''
            @connection       = raw_data['connection']        || ''
            @ip_address       = raw_data['ipAddress']         || ''
            @language         = raw_data['language']          || ''
            @orientation      = raw_data['orientation']       || ''
            @battery_level    = raw_data['batteryLevel']      || nil
            @rooted           = raw_data['rooted']            || false
          end
        end
      end
    end
  end
end
