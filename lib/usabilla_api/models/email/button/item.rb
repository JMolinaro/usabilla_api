module UsabillaApi
  module Models
    module Email
      module Button
        class Item
          attr_accessor :id, :date, :groups, :intro_text, :locale, :name

          def initialize(args = {})
            @id             = args['id']                  || ''
            @date           = args['date']                || ''
            @groups         = add_groups(args['groups'])  || {}
            @intro_text     = args['introText']           || ''
            @locale         = args['locale']              || ''
            @name           = args['name']                || ''
          end

          private

          def add_groups(hash)
            hash.map{ |group| UsabillaApi::Models::Email::Button::Groups.new(group) } unless hash.nil?
          end
        end
      end
    end
  end
end