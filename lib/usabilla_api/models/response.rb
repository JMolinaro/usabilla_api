module UsabillaApi
  module Models
    class Response
      attr_accessor :items, :count, :has_more, :last_time_stamp

      def initialize(args = {})
        @items                 = args['items'] || Array.new
        @count                 = args['count'] || 0
        @has_more              = args['hasMore'] || false
        @last_time_stamp       = args['lastTimestamp'] || nil
      end

    end
  end
end