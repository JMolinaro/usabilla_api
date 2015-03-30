require 'spec_helper'

module UsabillaApi
  module Models
    describe Response do
      let(:response) { Models::Response.new(response_hash) }
      let(:item_hash) { [] }
      let(:response_hash) do
        {
            'items' => item_hash,
            'count' => 13,
            'hasMore' => false,
            'lastTimestamp' => '01012015'
        }
      end

      context 'a response_hash is valid' do

        it { expect(response.items).to eq ([]) }
        it { expect(response.count).to eq (13) }
        it { expect(response.has_more).to eq (false) }
        it { expect(response.last_time_stamp).to eq ('01012015') }

      end

    end

  end
end