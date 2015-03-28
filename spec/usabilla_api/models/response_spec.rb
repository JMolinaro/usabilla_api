require 'spec_helper'

module UsabillaApi
  module Models
    describe Response do
      let(:response) { Models::Response.new(response_hash) }
      let(:item_hash) { [] }
      let(:response_hash) do
        {
            'items' => item_hash,
            'count' => 13,
            'hasMore' => false,
            'lastTimestamp' => '01012015'
        }
      end

      context 'a response_hash is valid' do

        it { expect(response.items).to eq ([]) }
        it { expect(response.count).to eq (13) }
        it { expect(response.has_more).to eq (false) }
        it { expect(response.last_time_stamp).to eq ('01012015') }

      end

      context 'the button method returns button items' do
        let(:item_hash) { [{'id' => '1234567890', 'name' => 'Teirson'}] }

        it { expect(response.buttons.first).to be_a Models::Button::Item }
        it { expect(response.buttons.first.id).to eq ('1234567890') }
        it { expect(response.buttons.first.name).to eq ('Teirson') }
      end

      context 'the feedback_items method returns feedback_items items' do
        let(:item_hash) { [{'id' => '1234567890', 'userAgent' => 'Agent', 'comment' => 'Feedback', 'location' => 'Atlanta',
                           'date' => '01012015', 'custom' => [], 'email' => 'test@test.com', 'image' => 'FeedbackImage',
                           'labels' => [], 'nps' => 0, 'publicUrl' => 'fakepublicurl.com', 'rating' => 0,
                           'buttonId' => '1234567890', 'tags' => [], 'url' => 'fakeurl.com'}] }

        it { expect(response.feedback_items.first).to be_a Models::Feedback::Item }
        it { expect(response.feedback_items.first.id).to eq('1234567890') }
        it { expect(response.feedback_items.first.user_agent).to eq ('Agent') }
        it { expect(response.feedback_items.first.comment).to eq ('Feedback') }
        it { expect(response.feedback_items.first.location).to eq ('Atlanta') }
        it { expect(response.feedback_items.first.date).to eq ('01012015') }
        it { expect(response.feedback_items.first.custom).to eq ([]) }
        it { expect(response.feedback_items.first.email).to eq ('test@test.com') }
        it { expect(response.feedback_items.first.image).to eq ('FeedbackImage') }
        it { expect(response.feedback_items.first.labels).to eq ([]) }
        it { expect(response.feedback_items.first.nps).to eq (0) }
        it { expect(response.feedback_items.first.public_url).to eq ('fakepublicurl.com') }
        it { expect(response.feedback_items.first.rating).to eq (0) }
        it { expect(response.feedback_items.first.button_id).to eq ('1234567890') }
        it { expect(response.feedback_items.first.tags).to eq ([]) }
        it { expect(response.feedback_items.first.url).to eq ('fakeurl.com') }
      end

      context 'the campaign method returns campaign items' do
        let(:item_hash) { [{'id' => '1234567890', 'date' => '01012015', 'buttonId' => '1234567890', 'analyticsId' => '1234567890', 'status' => 'Active', 'name' => 'Campaign', 'statistics' => statistics_hash, 'type' => 'CampaignType'}] }
        let(:statistics_hash) { {'views' => 1, 'completed' => 2, 'conversion' => 3} }

        it { expect(response.campaign.first).to be_a Models::Campaign::Item }
        it { expect(response.campaign.first.id).to eq('1234567890') }
        it { expect(response.campaign.first.date).to eq ('01012015') }
        it { expect(response.campaign.first.button_id).to eq ('1234567890') }
        it { expect(response.campaign.first.analytics_id).to eq ('1234567890') }
        it { expect(response.campaign.first.status).to eq ('Active') }
        it { expect(response.campaign.first.name).to eq ('Campaign') }
        it { expect(response.campaign.first.statistics).to be_a Models::Campaign::Statistics }
        it { expect(response.campaign.first.statistics.views).to eq (1) }
        it { expect(response.campaign.first.statistics.completed).to eq (2) }
        it { expect(response.campaign.first.statistics.conversion).to eq (3) }
        it { expect(response.campaign.first.type).to eq ('CampaignType') }


      end

      context 'the campaign_results method returns campaign_results items' do
        let(:item_hash) { [{'id' => '1234567890', 'userAgent' => 'Agent', 'location' => 'Atlanta', 'date' => '01012015',
                            'campaignId' => '1234567890', 'customData' => [], 'data' => [], 'url' => 'fakeurl.com',
                            'time' => '24:00'}] }

        it { expect(response.campaign_results.first).to be_a Models::CampaignResults::Item }
        it { expect(response.campaign_results.first.id).to eq('1234567890') }
        it { expect(response.campaign_results.first.user_agent).to eq ('Agent') }
        it { expect(response.campaign_results.first.location).to eq ('Atlanta') }
        it { expect(response.campaign_results.first.date).to eq ('01012015') }
        it { expect(response.campaign_results.first.campaign_id).to eq ('1234567890') }
        it { expect(response.campaign_results.first.custom_data).to eq ([]) }
        it { expect(response.campaign_results.first.data).to eq ([]) }
        it { expect(response.campaign_results.first.url).to eq ('fakeurl.com') }
        it { expect(response.campaign_results.first.time).to eq ('24:00') }
      end
    end

  end
end