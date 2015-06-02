require 'spec_helper'

describe UsabillaApi do

  context '#configure' do
    context 'when called with a block' do
      it 'yields a default configuration to play with' do
        UsabillaApi.configure do |c|
          c.should be_an_instance_of UsabillaApi::Config
        end
      end

      it 'caches the config if called again' do
        original_object_id = ''
        UsabillaApi.configure { |c1| original_object_id = c1.object_id }
        UsabillaApi.configure { |c2| c2.object_id.should eq original_object_id }
      end
    end
  end

  context '#request' do
    context 'when making a request' do
      before :each do
        UsabillaApi.configuration.access_key = access_key
        UsabillaApi.configuration.secret_key = secret_key
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_websites_button)).to_return(:body => button_json)
      end
      let(:access_key) { 'access-key' }
      let(:secret_key) { 'secret-key' }
      let(:params) { { 'days_ago' => 30 } }
      let(:button_json){ { items: [{ id: '1234567890', name: 'Teirson'}],
                           count: 1, hasMore: false, lastTimestamp: 1234567890 }.to_json  }
      let(:response) { UsabillaApi::Clients::Websites::Button.retrieve(params) }

      context 'and we have keys' do
        context 'call websites button retrieve to ensure success' do
          it { expect(response.items.first).to be_an_instance_of UsabillaApi::Models::Websites::Button::Item }
        end
      end

      context 'and no secret or access key is provided' do
        let(:access_key) { nil }
        let(:secret_key) { nil }
        it { expect{response}.to raise_error('The Access Key or Secret Key supplied is invalid.') }
      end
    end
  end
end
