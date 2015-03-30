module UsabillaApi
  module Clients
    class Button
      class << self

        def retrieve(params)
          request = UsabillaApi.api_client.new(params).get_buttons
          response = UsabillaApi.response.new(request)
          response.items = response.items.map {|item| UsabillaApi::Models::Button::Item.new(item)} unless response.items.nil?
          response
        end

        def feedback(params)
          request = UsabillaApi.api_client.new(params).get_feedback_items
          response = UsabillaApi.response.new(request)
          response.items = response.items.map {|item| UsabillaApi::Models::Feedback::Item.new(item)} unless response.items.nil?
          response
        end

      end
    end
  end
end