require 'spec_helper'

module UsabillaApi
  describe UsabillaApi::Clients::Apps::CampaignResults do

    let(:params) { { 'id' => '12345' } }
    let(:results_json) do 
      { items: [
        {
          "id": "4a5ef6c3-3a7f-4f51-b594-71820e1d8832",
          "date": "2017-08-07T08:06:12.213Z",
          "campaignId": "31b84efe-cbde-4bde-ac08-2b87g2c92b83",
          "appId": "c3fc6dd8-acde-418e-aacc-ddcadd4b661e",
          "data": {
            "app_satisfaction": "10",
            "comment": "the checkout process went smooth" 
          },
          "context": {
            "user_id": "97364879364",
            "returning_customer": "true",
            "email": "jane@usabilla.com" 
          },
          "metadata": {
            "app_name": "iOS Ecommerce App",
            "app_version": "10.2.18",
            "battery": 1,
            "device": "iPhone 7 Plus",
            "language": "en_US",
            "network_connection": "Cellular",
            "orientation": "Portrait",
            "os_version": "10.3.2",
            "screen": "1080x1920",
            "sdk_version": "4.0.3",
            "system": "iOS",
            "timestamp": "1494933327"
          },
            "complete": true
        }  
      ]}.to_json
    end

    describe '#retrieve' do
      before :each do
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_apps_campaign_results, params['id'])).to_return(:body => results_json)
      end
      let(:response) { UsabillaApi::Clients::Apps::CampaignResults.retrieve(params) }

      context 'when we call apps campaign results retrieve' do
        it { expect(response.items.first).to be_an_instance_of UsabillaApi::Models::Apps::Campaign::Results::Item }
      end

      context 'when no id is provided' do
        let(:params) { { 'id' => '' } }
        it { expect{response}.to raise_error('Invalid ID Parameter')}
      end

    end

  end
end
