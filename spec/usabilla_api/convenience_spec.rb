require 'spec_helper'

module UsabillaApi
  describe Convenience::ClassMethods do

    def expect_method_to_return_class(method, klass)
      returned_convenience_class = UsabillaApi.send(method)
      expect(returned_convenience_class).to be klass
    end

    def expect_method_to_return_type_of_class(method, klass, args = nil)
      returned_convenience_class = args ? UsabillaApi.send(method, args) : UsabillaApi.send(method)
      expect(returned_convenience_class).to be_a klass
    end

    context '#api_client' do
      it 'returns the main usabilla api client for api calls' do
        expect_method_to_return_class(:api_client, UsabillaApi::Client)
      end
    end

    context '#response' do
      it 'returns the model response class' do
        expect_method_to_return_class(:response, UsabillaApi::Models::Response)
      end
    end

    context '#apps_app' do
       it 'returns the apps_app client class' do
         expect_method_to_return_class(:apps_app, UsabillaApi::Clients::Apps::App)
      end
    end
    context '#apps_feedback' do
      it 'returns the apps_feedback client class' do
        expect_method_to_return_class(:apps_feedback, UsabillaApi::Clients::Apps::Feedback)
      end
    end
    context '#email_button' do
      it 'returns the email_button client class' do
        expect_method_to_return_class(:email_button, UsabillaApi::Clients::Email::Button)
      end
    end
    context '#email_feedback' do
      it 'returns the email_feedback client class' do
        expect_method_to_return_class(:email_feedback, UsabillaApi::Clients::Email::Feedback)
      end
    end
    context '#websites_button' do
      it 'returns the websites_button client class' do
        expect_method_to_return_class(:websites_button, UsabillaApi::Clients::Websites::Button)
      end
    end
    context '#websites_feedback' do
      it 'returns the websites_feedback client class' do
        expect_method_to_return_class(:websites_feedback, UsabillaApi::Clients::Websites::Feedback)
      end
    end
    context '#websites_campaign' do
      it 'returns the websites_campaign client class' do
        expect_method_to_return_class(:websites_campaign, UsabillaApi::Clients::Websites::Campaign)
      end
    end
    context '#websites_campaign_results' do
      it 'returns the websites_campaign_results client class' do
        expect_method_to_return_class(:websites_campaign_results, UsabillaApi::Clients::Websites::CampaignResults)
      end
    end
    context '#websites_campaign_stats' do
      it 'returns the websites_campaign_stats client class' do
        expect_method_to_return_class(:websites_campaign_stats, UsabillaApi::Clients::Websites::CampaignStats)
      end
    end

  end

end
