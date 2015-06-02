require 'spec_helper'

module UsabillaApi
  module Models
    module Apps
      module Feedback
        describe Data do
          let(:data) { Models::Apps::Feedback::Data.new(data_hash) }

          context 'a app data_hash is valid' do
            let(:data_hash) do
              {
                  'name' => 'user_agent',
                  'nps' => 1,
                  'rating' => 2,
                  'speed' => 3,
                  'subject' => 'test_subject'

              }
            end

            it { expect(data.name).to eq('user_agent') }
            it { expect(data.nps).to eq (1) }
            it { expect(data.rating).to eq (2) }
            it { expect(data.speed).to eq (3) }
            it { expect(data.subject).to eq ('test_subject') }

          end
        end
      end
    end
  end
end
