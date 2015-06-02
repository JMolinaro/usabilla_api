require 'spec_helper'

module UsabillaApi
  describe UsabillaApi::Clients::Websites::Campaign do

    let(:params) { {} }
    let(:campaign_json){ { items: [{id: '1234567890', date: '01012015', buttonId: '1234567890',
                                    analyticsId: '1234567890', status: 'Active', name: 'Campaign',
                                    statistics: {views: 1, completed: 2, conversion: 3},
                                    type: 'CampaignType'}],
                         count: 1, hasMore: false, lastTimestamp: 1234567890 }.to_json  }

    describe '#retrieve' do
      before :each do
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_websites_campaign)).to_return(:body => campaign_json)
      end
      let(:response) { UsabillaApi::Clients::Websites::Campaign.retrieve(params) }

      context 'when we call campaign retrieve' do
        it { expect(response.items.first).to be_an_instance_of UsabillaApi::Models::Websites::Campaign::Item }
      end

    end
  end
end
