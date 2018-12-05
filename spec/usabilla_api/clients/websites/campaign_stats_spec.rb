require 'spec_helper'

module UsabillaApi
  describe UsabillaApi::Clients::Websites::CampaignStats do

    let(:params) { { 'id' => '12345' } }
    let(:results_json){ { items: [{ id: '1234567890', completed: 'Agent', conversion: 'Atlanta', views: '01012015'}],
                          count: 1, hasMore: false, lastTimestamp: 1234567890 }.to_json }

    describe '#retrieve' do
      before :each do
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_websites_campaign_stats, params['id'])).to_return(:body => results_json)
      end
      let(:response) { UsabillaApi::Clients::Websites::CampaignStats.retrieve(params) }
      let(:params) { { 'id' => '12345' } }

      context 'when we call websites campaign stats retrieve' do
        it { expect(response.items.first).to be_an_instance_of UsabillaApi::Models::Websites::Campaign::Stats::Item }
      end

      context 'when no id is provided' do
        let(:params) { { 'id' => '' } }
        it { expect{response}.to raise_error('Invalid ID Parameter')}
      end

    end

  end
end
