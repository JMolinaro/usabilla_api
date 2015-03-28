require 'usabilla_api/config'
require 'usabilla_api/convenience'
require 'usabilla_api/usabilla_api'

def require_directory(relative_path)
  Dir[File.dirname(__FILE__) + relative_path].each { |file| require file }
end

%w(/usabilla_api/clients/**/*.rb /usabilla_api/models/**.rb
   /usabilla_api/models/**/*.rb).each { |path| require_directory path }

module UsabillaApi
  extend Convenience::ClassMethods

  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= UsabillaApi::Config.new
    @configuration
  end
end
