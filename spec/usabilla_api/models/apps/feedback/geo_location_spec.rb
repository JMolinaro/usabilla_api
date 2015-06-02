require 'spec_helper'

module UsabillaApi
  module Models
    module Apps
      module Feedback
        describe GeoLocation do
          let(:geo_location) { Models::Apps::Feedback::GeoLocation.new(geo_location_hash) }

          context 'a apps geo_location is valid' do
            let(:geo_location_hash) do
              {
                  'city' => 'test_city',
                  'country' => 'test_country',
                  'lat' => 2,
                  'lon' => 3,
                  'region' => 'test_region'

              }
            end

            it { expect(geo_location.city).to eq('test_city') }
            it { expect(geo_location.country).to eq ('test_country') }
            it { expect(geo_location.lat).to eq (2) }
            it { expect(geo_location.lon).to eq (3) }
            it { expect(geo_location.region).to eq ('test_region') }

          end
        end
      end
    end
  end
end
