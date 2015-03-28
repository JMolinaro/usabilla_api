module UsabillaApi
  module Convenience
    module ClassMethods

      def api_client
        UsabillaApi::Client
      end

      def response
        UsabillaApi::Models::Response
      end

      def button(params)
        UsabillaApi::Clients::Button.retrieve(params)
      end

      def feedback_items(params)
        UsabillaApi::Clients::Button.feedback(params)
      end

      def campaign(params)
        UsabillaApi::Clients::Campaign.retrieve(params)
      end

      def campaign_results(params)
        UsabillaApi::Clients::Campaign.results(params)
      end
    end
  end
end