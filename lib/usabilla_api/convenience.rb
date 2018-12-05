module UsabillaApi
  module Convenience
    module ClassMethods

      def api_client
        UsabillaApi::Client
      end

      def response
        UsabillaApi::Models::Response
      end

      def apps_app
        UsabillaApi::Clients::Apps::App
      end

      def apps_feedback
        UsabillaApi::Clients::Apps::Feedback
      end

      def apps_campaign_results
        UsabillaApi::Clients::Apps::CampaignResults
      end

      def email_button
        UsabillaApi::Clients::Email::Button
      end

      def email_feedback
        UsabillaApi::Clients::Email::Feedback
      end

      def websites_button
        UsabillaApi::Clients::Websites::Button
      end

      def websites_feedback
        UsabillaApi::Clients::Websites::Feedback
      end

      def websites_campaign
        UsabillaApi::Clients::Websites::Campaign
      end

      def websites_campaign_results
        UsabillaApi::Clients::Websites::CampaignResults
      end

      def websites_campaign_stats
        UsabillaApi::Clients::Websites::CampaignStats
      end

    end
  end
end