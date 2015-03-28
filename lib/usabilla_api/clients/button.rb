require 'json'

module UsabillaApi
  module Clients
    class Button
      class << self

        def retrieve(params)
          request = UsabillaApi.api_client.new(params).get_buttons
          request = UsabillaApi.response.new(JSON.parse(request)).buttons unless return_json_response
          request
        end

        def feedback(params)
          request = UsabillaApi.api_client.new(params).get_feedback_items
          request = UsabillaApi.response.new(JSON.parse(request)).feedback_items unless return_json_response
          request
        end

        private

        def return_json_response
          UsabillaApi.configuration.json_response
        end

      end
    end
  end
end