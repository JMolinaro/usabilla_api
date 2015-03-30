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
end
