require 'spec_helper'

module UsabillaApi
  module Models
    module Email
      module Feedback
        describe Item do
          let(:feedback) { Models::Email::Feedback::Item.new(feedback_hash) }

          context 'a email feedback_hash is valid' do
            let(:feedback_hash) do
              {
                  'id' => '1234567890',
                  'userAgent' => 'user_agent',
                  'comment' => 'comment',
                  'location' => 'location',
                  'date' => 'date12345',
                  'custom' => [],
                  'email' => 'test@test.com',
                  'labels' => [],
                  'nps' => 4,
                  'publicUrl' => 'www.testpuburl.com',
                  'rating' => 4,
                  'buttonId' => '12345',
                  'tags' => [],
                  'url' => 'www.testurl.com'

              }
            end

            it { expect(feedback.id).to eq('1234567890') }
            it { expect(feedback.user_agent).to eq ('user_agent') }
            it { expect(feedback.comment).to eq ('comment') }
            it { expect(feedback.location).to eq ('location') }
            it { expect(feedback.custom).to eq ([]) }
            it { expect(feedback.email).to eq ('test@test.com') }
            it { expect(feedback.labels).to eq ([]) }
            it { expect(feedback.nps).to eq (4) }
            it { expect(feedback.public_url).to eq ('www.testpuburl.com') }
            it { expect(feedback.rating).to eq (4) }
            it { expect(feedback.button_id).to eq ('12345') }
            it { expect(feedback.tags).to eq ([]) }
            it { expect(feedback.url).to eq ('www.testurl.com') }

          end
        end
      end
    end
  end
end