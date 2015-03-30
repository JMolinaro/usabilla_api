module UsabillaApi
  module Convenience
    module ClassMethods

      def api_client
        UsabillaApi::Client
      end

      def response
        UsabillaApi::Models::Response
      end

      def button
        UsabillaApi::Clients::Button
      end

      def campaign
        UsabillaApi::Clients::Campaign
      end

    end
  end
end