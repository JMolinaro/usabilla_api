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

      def buttons
        @items = @items.map {|item| UsabillaApi::Models::Button::Item.new(item)} unless @items.nil?
      end

      def feedback_items
        @items = @items.map {|item| UsabillaApi::Models::Feedback::Item.new(item)} unless @items.nil?
      end

      def campaign
        @items = @items.map {|item| UsabillaApi::Models::Campaign::Item.new(item)} unless @items.nil?
      end

      def campaign_results
        @items = @items.map {|item| UsabillaApi::Models::Campaign::Item.new(item)} unless @items.nil?
      end
    end
  end
end