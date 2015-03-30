require 'spec_helper'

module UsabillaApi
  module Models
    module Campaign
      describe Statistics do
        let(:statistics) { Models::Campaign::Statistics.new(statistics_hash) }

        context 'a statisctics_hash is valid' do
          let(:statistics_hash) do
            {
                'views' => 1,
                'completed' => 2,
                'conversion' => 3
            }
          end
          it { expect(statistics.views).to eq(1) }
          it { expect(statistics.completed).to eq (2) }
          it { expect(statistics.conversion).to eq (3) }
        end
      end
    end
  end
end