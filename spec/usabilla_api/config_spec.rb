require 'spec_helper'

module UsabillaApi
  describe UsabillaApi::Config do

    context 'defaults' do
      it 'should have a base_uri' do
        UsabillaApi.configuration.base_uri.should_not be_nil
      end
      it 'should have a base_uri with https' do
        UsabillaApi.configuration.base_uri[0..4].should == 'https'
      end
    end

    context 'uri' do
      it 'should change base_uri' do
        uri = 'hello world'
        config = UsabillaApi.configuration
        default_uri = config.base_uri

        config.set_base_uri(uri)
        config.base_uri.should == uri

        config.set_base_uri(default_uri)
        config.base_uri.should == default_uri
      end
    end

  end
end