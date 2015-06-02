require 'spec_helper'

module UsabillaApi
  describe UsabillaApi::Clients::Email::Button do

    let(:params) { {} }
    let(:button_json){ { items: [{ id: '1234567890', name: 'Teirson'}],
                         count: 1, hasMore: false, lastTimestamp: 1234567890 }.to_json  }

    describe '#retrieve' do
      before :each do
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_email_button)).to_return(:body => button_json)
      end
      let(:response) { UsabillaApi::Clients::Email::Button.retrieve(params) }

      context 'when we call email button retrieve' do
        it { expect(response.items.first).to be_an_instance_of UsabillaApi::Models::Email::Button::Item }
      end

    end

  end
end
