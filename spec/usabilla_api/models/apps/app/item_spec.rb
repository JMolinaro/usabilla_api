require 'spec_helper'

module UsabillaApi
  module Models
    module Apps
      module App
        describe Item do
          let(:app) { Models::Apps::App::Item.new(app_hash) }

          context 'a email feedback_hash is valid' do
            let(:app_hash) do
              {
                  'id' => '1234567890',
                  'name' => 'user_agent',
                  'date' => 'date12345',
                  'status' => 'active'

              }
            end

            it { expect(app.id).to eq('1234567890') }
            it { expect(app.name).to eq ('user_agent') }
            it { expect(app.date).to eq ('date12345') }
            it { expect(app.status).to eq ('active') }

          end
        end
      end
    end
  end
end