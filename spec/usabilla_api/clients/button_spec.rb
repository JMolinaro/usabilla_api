require 'spec_helper'

module UsabillaApi
  describe UsabillaApi::Clients::Button do
    before(:each) {
      UsabillaApi.configuration.access_key = access_key
      UsabillaApi.configuration.secret_key = secret_key
    }
    let(:access_key) { 'access-key' }
    let(:secret_key) { 'secret-key' }
    let(:params) { {} }
    let(:button_json){ { items: [{ id: '1234567890', name: 'Teirson'}],
                         count: 1, hasMore: false, lastTimestamp: 1234567890 }.to_json  }
    let(:feedback_json){ { items: [{ id: '1234567890', userAgent: 'Agent', comment: 'Feedback',
                                     location: 'Atlanta', date: '01012015', custom: [], email: 'test@test.com',
                                     image: 'FeedbackImage', labels: [], nps: 0, publicUrl: 'fakepublicurl.com',
                                     rating: 0, buttonId: '1234567890', tags: [], url: 'fakeurl.com'}],
                           count: 1, hasMore: false, lastTimestamp: 1234567890 }.to_json }

    describe '#retrieve' do
      before :each do
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_button)).to_return(:body => button_json)
      end
      let(:response) { UsabillaApi::Clients::Button.retrieve(params) }

      context 'when no secret or access key is provided' do
        let(:access_key) { nil }
        let(:secret_key) { nil }
        it { expect{response}.to raise_error('The Access Key or Secret Key supplied is invalid.') }
      end

      context 'when we call button retrieve' do
        it { expect(response.items.first).to be_an_instance_of UsabillaApi::Models::Button::Item }
      end

    end

    describe '#feedback' do
      before :each do
        stub_request(:get, uri_stem(UsabillaApi.configuration.uri_feedback_items.gsub(':id', params['id']))).to_return(:body => feedback_json)
      end
      let(:response) { UsabillaApi::Clients::Button.feedback(params) }
      let(:params) { { 'id' => '12345' } }

      context 'when we call button feedback' do
        it { expect(response.items.first).to be_an_instance_of UsabillaApi::Models::Feedback::Item }
      end

      context 'when no id is provided' do
        let(:params) { { 'id' => '' } }
        it { expect{response}.to raise_error('Invalid Button ID') }
      end

    end

  end
end
