require 'spec_helper'

module UsabillaApi
  module Models
    module Campaign
      describe Item do
        let(:campaign) { Models::Campaign::Item.new(campaign_hash) }

        context 'a campaign_hash is valid' do
          let(:campaign_hash) do
            {
                'id' => '1234567890',
                'date' => '01012015',
                'buttonId' => '1234567890',
                'analyticsId' => '1234567890',
                'status' => 'Active',
                'name' => 'Campaign',
                'statistics' => statistics_hash,
                'type' => 'CampaignType'
            }
          end
          let(:statistics_hash) do
            {
                'views' => 1,
                'completed' => 2,
                'conversion' => 3
            }
          end
          it { expect(campaign.id).to eq('1234567890') }
          it { expect(campaign.date).to eq ('01012015') }
          it { expect(campaign.button_id).to eq ('1234567890') }
          it { expect(campaign.analytics_id).to eq ('1234567890') }
          it { expect(campaign.status).to eq ('Active') }
          it { expect(campaign.name).to eq ('Campaign') }
          it { expect(campaign.statistics).to be_a Models::Campaign::Statistics }
          it { expect(campaign.type).to eq ('CampaignType') }

        end
      end
    end
  end
end