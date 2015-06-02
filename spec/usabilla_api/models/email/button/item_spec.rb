require 'spec_helper'

module UsabillaApi
  module Models
    module Email
      module Button
        describe Item do
          let(:button) { Models::Email::Button::Item.new(button_hash) }

          context 'a email button_hash is valid' do
            let(:button_hash) do
              {
                  'id' => '1234567890',
                  'date' => '12345',
                  'groups' => [],
                  'introText' => 'intro_text',
                  'locale' => 'en-us',
                  'name' => 'Teirson'
              }
            end

            it { expect(button.id).to eq('1234567890') }
            it { expect(button.date).to eq ('12345') }
            it { expect(button.groups).to eq ([]) }
            it { expect(button.intro_text).to eq ('intro_text') }
            it { expect(button.locale).to eq ('en-us') }
            it { expect(button.name).to eq ('Teirson') }
          end
        end
      end
    end
  end
end