module UsabillaApi
  module Models
    module Websites
      module Button
        class Item
          attr_accessor :id, :name

          def initialize(args = {})
            @id     = args['id']    || ''
            @name   = args['name']  || ''
          end
        end
      end
    end
  end
end