require 'spec_helper'

module UsabillaApi
  module Models
    module Apps
      module Feedback
        describe Data do
          let(:feedback) { Models::Apps::Feedback::Item.new(feedback_hash) }

          context 'a apps feedback_hash is valid' do
            let(:feedback_hash) do
              {
                  'id' => '12345',
                  'date' => 'date12345',
                  'timestamp' => 'timestamp',
                  'deviceName' => 'device_name',
                  'data' => [],
                  'custom' => [],
                  'appId' => 'app_id',
                  'appName' => 'app_name',
                  'appVersion' => 'app_version',
                  'osName' => 'os_name',
                  'osVersion' => 'os_version',
                  'location' => 'location',
                  'geoLocation' => [],
                  'freeMemory' => 1,
                  'totalMemory' => 2,
                  'freeStorage' => 3,
                  'totalStorage' => 4,
                  'screenshot' => 'screenshot',
                  'connection' => 'connection',
                  'ipAddress' => 'ip_address',
                  'language' => 'language',
                  'orientation' => 'orientation',
                  'batteryLevel' => 'battery_level',
                  'rooted' => true
              }
            end

            it { expect(feedback.id).to eq('12345') }
            it { expect(feedback.date).to eq('date12345') }
            it { expect(feedback.timestamp).to eq('timestamp') }
            it { expect(feedback.device_name).to eq('device_name') }
            it { expect(feedback.data).to eq([]) }
            it { expect(feedback.custom).to eq([]) }
            it { expect(feedback.app_id).to eq('app_id') }
            it { expect(feedback.app_name).to eq('app_name') }
            it { expect(feedback.app_version).to eq('app_version') }
            it { expect(feedback.os_name).to eq('os_name') }
            it { expect(feedback.os_version).to eq('os_version') }
            it { expect(feedback.location).to eq('location') }
            it { expect(feedback.geo_location).to eq([]) }
            it { expect(feedback.free_memory).to eq(1) }
            it { expect(feedback.total_memory).to eq(2) }
            it { expect(feedback.free_storage).to eq(3) }
            it { expect(feedback.total_storage).to eq(4) }
            it { expect(feedback.screenshot).to eq('screenshot') }
            it { expect(feedback.connection).to eq('connection') }
            it { expect(feedback.ip_address).to eq('ip_address') }
            it { expect(feedback.language).to eq('language') }
            it { expect(feedback.orientation).to eq('orientation') }
            it { expect(feedback.battery_level).to eq('battery_level') }
            it { expect(feedback.rooted).to eq(true) }
          end
        end
      end
    end
  end
end
