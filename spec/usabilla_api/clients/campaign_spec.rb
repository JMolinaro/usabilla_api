require 'spec_helper'

module UsabillaApi
  describe UsabillaApi::Clients::Campaign do
    before(:each) {
      UsabillaApi.configuration.access_key = access_key
      UsabillaApi.configuration.secret_key = secret_key
      UsabillaApi.configuration.json_response = set_json_response
    }
    let(:access_key) { 'access-key' }
    let(:secret_key) { 'secret-key' }
    let(:params) { {} }
    let(:set_json_response) { false }
    let(:campaign_json){ { items: [{id: '1234567890', date: '01012015', buttonId: '1234567890',
                                    analyticsId: '1234567890', status: 'Active', name: 'Campaign',
                                    statistics: {views: 1, completed: 2, conversion: 3},
                                    type: 'CampaignType'}],
                         count: 1, hasMore: false, lastTimestamp: 1234567890 }.to_json  }
    let(:results_json){ { items: [{ id: '1234567890', userAgent: 'Agent', location: 'Atlanta',
                                    date: '01012015', campaignId: '1234567890', customData: [],
                                    data: [], url: 'fakeurl.com', time: '24:00'}],
                           count: 1, hasMore: false, lastTimestamp: 1234567890 }.to_json }

    describe '#retrieve' do
      before :each do
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_campaign)).to_return(:body => campaign_json)
      end
      let(:response) { UsabillaApi::Clients::Campaign.retrieve(params) }

      context 'when no secret or access key is provided' do
        let(:access_key) { nil }
        let(:secret_key) { nil }
        it { expect{response}.to raise_error('The Access Key or Secret Key supplied is invalid.') }
      end

      context 'when we call campaign retrieve' do
        it { expect(response.first).to be_an_instance_of UsabillaApi::Models::Campaign::Item }
      end

      context 'when we set json response true' do
        let(:set_json_response) { true }
        it { expect(response).to eq (campaign_json) }
      end
    end

    describe '#results' do
      before :each do
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_campaign_results.gsub(':id', params['id']))).to_return(:body => results_json)
      end
      let(:response) { UsabillaApi::Clients::Campaign.results(params) }
      let(:params) { { 'id' => '12345' } }

      context 'when we call campaign results' do
        it { expect(response.first).to be_an_instance_of UsabillaApi::Models::CampaignResults::Item }
      end

      context 'when we set json response true' do
        let(:set_json_response) { true }
        it { expect(response).to eq (results_json) }
      end

      context 'when no id is provided' do
        let(:params) { { 'id' => '' } }
        it { expect{response}.to raise_error('Invalid Campaign ID')}
      end

    end

  end
end
