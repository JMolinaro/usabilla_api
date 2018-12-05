$:.push File.expand_path('../lib', __FILE__)
require 'usabilla_api/version'

Gem::Specification.new do |s|
  s.name        = 'usabilla_api'
  s.version     = UsabillaApi::VERSION
  s.summary     = "Ruby Usabilla API Gem."
  s.description = "A Ruby Usabilla API Gem that will allow you to connect to and use the Usabilla API"
  s.authors     = ["Jon Molinaro"]
  s.email       = 'Teirson@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/usabilla_api'
  s.license     = 'MIT'

  s.files        = Dir['{lib}/**/*.rb', 'LICENSE', '*.md']
  s.require_path = 'lib'

  s.add_dependency 'rest-client', '>= 1.7'
  s.add_dependency 'json', '~> 1.8.1'


  s.add_development_dependency 'rake', '~> 0.8', '>= 0.8.7'
  s.add_development_dependency 'webmock', '~> 2.3', '>= 2.3.0'
  s.add_development_dependency 'simplecov', '~> 0.7', '>= 0.7.1'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'rspec-pride', '~> 2.2', '>= 2.2.0'
  s.add_development_dependency 'activesupport', '~> 4.2', '>= 4.2.0'
end
