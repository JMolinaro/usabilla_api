module UsabillaApi
  module Models
    module Email
      module Button
        class Groups
          attr_accessor :id, :active, :date, :name

          def initialize(args = {})
            @id         = args['id']          || ''
            @active     = args['active']      || false
            @date       = args['date']        || ''
            @name       = args['name']        || ''
          end
        end
      end
    end
  end
end