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
      @base_scope                   = '/live/website'
      @base_uri                     = @host_protocol + @host + @base_scope
      set_default_api_uris
      set_attr_accessors
    end

    private
    #################################################################

    def set_default_api_uris
      @uri_button                 ||= '/button'
      @uri_feedback_items         ||= '/button/:id/feedback'
      @uri_campaign               ||= '/campaign'
      @uri_campaign_results       ||= '/campaign/:id/results'
    end

    def set_attr_accessors
      instance_variables.each { |instance_variable| self.class.send :attr_accessor, instance_variable[1..-1].to_sym }
    end

  end
end
