module UsabillaApi
  module Models
    module Apps
      module App
        class Item
          attr_accessor :id, :name, :date, :status, :raw_data

          def initialize(args = {})
            @raw_data       = args.with_indifferent_access
            @id             = raw_data['id']      || ''
            @name           = raw_data['name']    || ''
            @date           = raw_data['date']    || ''
            @status         = raw_data['status']  || ''
          end

        end
      end
    end
  end
end
