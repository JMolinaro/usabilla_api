require 'spec_helper'

module UsabillaApi
  module Models
    module Websites
      module Campaign
        module Stats
          describe Item do
            let(:statistics) { Models::Websites::Campaign::Stats::Item.new(statistics_hash) }

            context 'a statisctics_hash is valid' do
              let(:statistics_hash) do
                {
                    'id' => 'id1234',
                    'views' => 1,
                    'completed' => 2,
                    'conversion' => 3
                }
              end
              it { expect(statistics.id).to eq('id1234') }
              it { expect(statistics.views).to eq(1) }
              it { expect(statistics.completed).to eq (2) }
              it { expect(statistics.conversion).to eq (3) }
            end
          end
        end
      end
    end
  end
end