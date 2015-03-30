require 'spec_helper'

module UsabillaApi
  module Models
    module Feedback
      describe Item do
        let(:feedback) { Models::Feedback::Item.new(feedback_hash) }

        context 'a feedback_hash is valid' do
          let(:feedback_hash) do
            {
                'id' => '1234567890',
                'userAgent' => 'Agent',
                'comment' => 'Feedback',
                'location' => 'Atlanta',
                'date' => '01012015',
                'custom' => [],
                'email' => 'test@test.com',
                'image' => 'FeedbackImage',
                'labels' => [],
                'nps' => 0,
                'publicUrl' => 'fakepublicurl.com',
                'rating' => 0,
                'buttonId' => '1234567890',
                'tags' => [],
                'url' => 'fakeurl.com'
            }
          end

          it { expect(feedback.id).to eq('1234567890') }
          it { expect(feedback.user_agent).to eq ('Agent') }
          it { expect(feedback.comment).to eq ('Feedback') }
          it { expect(feedback.location).to eq ('Atlanta') }
          it { expect(feedback.date).to eq ('01012015') }
          it { expect(feedback.custom).to eq ([]) }
          it { expect(feedback.email).to eq ('test@test.com') }
          it { expect(feedback.image).to eq ('FeedbackImage') }
          it { expect(feedback.labels).to eq ([]) }
          it { expect(feedback.nps).to eq (0) }
          it { expect(feedback.public_url).to eq ('fakepublicurl.com') }
          it { expect(feedback.rating).to eq (0) }
          it { expect(feedback.button_id).to eq ('1234567890') }
          it { expect(feedback.tags).to eq ([]) }
          it { expect(feedback.url).to eq ('fakeurl.com') }

        end
      end
    end
  end
end