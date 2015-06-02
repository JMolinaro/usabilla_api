require 'spec_helper'

module UsabillaApi
  module Models
    module Websites
      module Button
        describe Item do
          let(:button) { Models::Websites::Button::Item.new(button_hash) }

          context 'a button_hash is valid' do
            let(:button_hash) do
              {
                  'id' => '1234567890',
                  'name' => 'Teirson'
              }
            end
            it { expect(button.id).to eq('1234567890') }
            it { expect(button.name).to eq ('Teirson') }
          end
        end
      end
    end
  end
end