module UsabillaApi
  module Clients
    module Websites
      class Feedback
        class << self

          def retrieve(params)
            request = UsabillaApi.api_client.new(params).request(UsabillaApi.configuration.uri_websites_feedback, true)
            response = UsabillaApi.response.new(request)
            response.items = response.items.map {|item| UsabillaApi::Models::Websites::Feedback::Item.new(item)} unless response.items.nil?
            response
          end

        end
      end
    end
  end
end