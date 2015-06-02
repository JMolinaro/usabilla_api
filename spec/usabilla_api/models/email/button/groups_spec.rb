require 'spec_helper'

module UsabillaApi
  module Models
    module Email
      module Button
        describe Groups do
          let(:group) { Models::Email::Button::Groups.new(group_hash) }

          context 'a button_hash is valid' do
            let(:group_hash) do
              {
                  'id' => '1234567890',
                  'active' => true,
                  'date' => '12345',
                  'name' => 'Teirson'
              }
            end
            it { expect(group.id).to eq('1234567890') }
            it { expect(group.active).to eq (true) }
            it { expect(group.date).to eq ('12345') }
            it { expect(group.name).to eq ('Teirson') }

          end
        end
      end
    end
  end
end