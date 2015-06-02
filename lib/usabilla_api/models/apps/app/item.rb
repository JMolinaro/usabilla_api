module UsabillaApi
  module Models
    module Apps
      module App
        class Item
          attr_accessor :id, :name, :date, :status

          def initialize(args = {})
            @id             = args['id']      || ''
            @name           = args['name']    || ''
            @date           = args['date']    || ''
            @status         = args['status']  || ''
          end

        end
      end
    end
  end
end