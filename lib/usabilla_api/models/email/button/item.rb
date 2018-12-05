module UsabillaApi
  module Models
    module Email
      module Button
        class Item
          attr_accessor :id, :date, :groups, :intro_text, :locale, :name,
                        :raw_data

          def initialize(args = {})
            @raw_data       = args.with_indifferent_access
            @id             = raw_data['id']                  || ''
            @date           = raw_data['date']                || ''
            @groups         = add_groups(raw_data['groups'])  || {}
            @intro_text     = raw_data['introText']           || ''
            @locale         = raw_data['locale']              || ''
            @name           = raw_data['name']                || ''
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
