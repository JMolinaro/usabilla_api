require 'spec_helper'

module UsabillaApi
  describe UsabillaApi::Config do
    context 'defaults' do
      it 'should have a base_uri' do
        expect(UsabillaApi.configuration.base_uri).not_to be_nil
      end
      it 'should have a base_uri with https' do
        expect(UsabillaApi.configuration.base_uri[0..4]).to eq 'https'
      end
    end

    context 'uri' do
      it 'should change base_uri' do
        uri = 'hello world'
        config = UsabillaApi.configuration
        default_uri = config.base_uri

        config.set_base_uri(uri)
        expect(config.base_uri).to eq uri

        config.set_base_uri(default_uri)
        expect(config.base_uri).to eq default_uri
      end
    end
  end
end