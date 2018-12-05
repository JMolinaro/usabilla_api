module UsabillaApi
  module Models
    module Websites
      module Button
        class Item
          attr_accessor :id, :name, :raw_data

          def initialize(args = {})
            @raw_data = args.with_indifferent_access
            @id       = raw_data['id']    || ''
            @name     = raw_data['name']  || ''
          end
        end
      end
    end
  end
end
