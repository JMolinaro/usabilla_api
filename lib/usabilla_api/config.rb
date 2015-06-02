module UsabillaApi
  class Config

    def initialize
      set_defaults
    end

    def set_base_uri(uri)
      @base_uri = uri
    end

    protected
    #################################################################

    def set_defaults
      @access_key                   = nil
      @secret_key                   = nil
      @http_method                  = 'GET'
      @host_protocol                = 'https://'
      @host                         = 'data.usabilla.com'
      @base_scope                   = '/live'
      @base_uri                     = @host_protocol + @host + @base_scope
      set_default_api_uris
      set_attr_accessors
    end

    private
    #################################################################

    def set_default_api_uris
      # Apps
      @uri_apps_app                       ||= '/apps'
      @uri_apps_feedback                  ||= '/apps/:id/feedback'

      # Email
      @uri_email_button                   ||= '/email/button'
      @uri_email_feedback                 ||= '/email/button/:id/feedback'

      # Website
      @uri_websites_button                ||= '/websites/button'
      @uri_websites_feedback              ||= '/websites/button/:id/feedback'
      @uri_websites_campaign              ||= '/websites/campaign'
      @uri_websites_campaign_results      ||= '/websites/campaign/:id/results'
      @uri_websites_campaign_stats        ||= '/websites/campaign/:id/stats'
    end

    def set_attr_accessors
      instance_variables.each { |instance_variable| self.class.send :attr_accessor, instance_variable[1..-1].to_sym }
    end

  end
end
