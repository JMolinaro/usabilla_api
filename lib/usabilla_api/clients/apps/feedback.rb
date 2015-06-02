module UsabillaApi
  module Clients
    module Apps
      class Feedback
        class << self

          def retrieve(params)
            request = UsabillaApi.api_client.new(params).request(UsabillaApi.configuration.uri_apps_feedback, true)
            response = UsabillaApi.response.new(request)
            response.items = response.items.map {|item| UsabillaApi::Models::Apps::Feedback::Item.new(item)} unless response.items.nil?
            response
          end

        end
      end
    end
  end
end