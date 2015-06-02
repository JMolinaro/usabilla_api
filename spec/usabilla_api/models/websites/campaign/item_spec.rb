require 'spec_helper'

module UsabillaApi
  module Models
    module Websites
      module Campaign
        describe Item do
          let(:campaign) { Models::Websites::Campaign::Item.new(campaign_hash) }

          context 'a campaign_hash is valid' do
            let(:campaign_hash) do
              {
                  'id' => '1234567890',
                  'date' => '01012015',
                  'buttonId' => '1234567890',
                  'analyticsId' => '1234567890',
                  'status' => 'Active',
                  'name' => 'Campaign',
                  'type' => 'CampaignType'
              }
            end

            it { expect(campaign.id).to eq('1234567890') }
            it { expect(campaign.date).to eq ('01012015') }
            it { expect(campaign.button_id).to eq ('1234567890') }
            it { expect(campaign.analytics_id).to eq ('1234567890') }
            it { expect(campaign.status).to eq ('Active') }
            it { expect(campaign.name).to eq ('Campaign') }
            it { expect(campaign.type).to eq ('CampaignType') }

          end
        end
      end
    end
  end
end