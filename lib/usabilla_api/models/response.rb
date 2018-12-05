module UsabillaApi
  module Models
    class Response
      attr_accessor :items, :count, :has_more, :last_time_stamp

      def initialize(args = {})
        @items                 = args.with_indifferent_access['items'] || Array.new
        @count                 = args.with_indifferent_access['count'] || 0
        @has_more              = args.with_indifferent_access['hasMore'] || false
        @last_time_stamp       = args.with_indifferent_access['lastTimestamp'] || nil
      end

    end
  end
end