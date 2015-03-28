require 'spec_helper'

module UsabillaApi
  module Models
    module CampaignResults
      describe Item do
        let(:campaign) { Models::CampaignResults::Item.new(campaign_hash) }

        context 'a campaign_hash is valid' do
          let(:campaign_hash) do
            {
                'id' => '1234567890',
                'userAgent' => 'Agent',
                'location' => 'Atlanta',
                'date' => '01012015',
                'campaignId' => '1234567890',
                'customData' => [],
                'data' => [],
                'url' => 'fakeurl.com',
                'time' => '24:00'
            }
          end
          it { expect(campaign.id).to eq('1234567890') }
          it { expect(campaign.user_agent).to eq ('Agent') }
          it { expect(campaign.location).to eq ('Atlanta') }
          it { expect(campaign.date).to eq ('01012015') }
          it { expect(campaign.campaign_id).to eq ('1234567890') }
          it { expect(campaign.custom_data).to eq ([]) }
          it { expect(campaign.data).to eq ([]) }
          it { expect(campaign.url).to eq ('fakeurl.com') }
          it { expect(campaign.time).to eq ('24:00') }
        end
      end
    end
  end
end