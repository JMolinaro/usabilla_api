module UsabillaApi
  module Models
    module Email
      module Button
        class Groups
          attr_accessor :id, :active, :date, :name

          def initialize(args = {})
            @id         = args.with_indifferent_access['id']          || ''
            @active     = args.with_indifferent_access['active']      || false
            @date       = args.with_indifferent_access['date']        || ''
            @name       = args.with_indifferent_access['name']        || ''
          end
        end
      end
    end
  end
end