$:.push File.expand_path('lib')
require 'usabilla_api/version'

Gem::Specification.new do |s|
  s.name        = 'usabilla_api'
  s.version     = UsabillaApi::VERSION
  s.summary     = 'Ruby Usabilla API Gem.'
  s.description = 'A Ruby Usabilla API Gem that will allow you to connect to and use the Usabilla API'
  s.authors     = ['Jon Molinaro']
  s.email       = 'Teirson@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/usabilla_api'
  s.license     = 'MIT'

  s.files        = Dir['{lib}/**/*.rb', 'LICENSE', '*.md']
  s.require_path = 'lib'

  s.add_dependency 'json', '~> 2.3.1'
  s.add_dependency 'rest-client', '>= 2.1.0'

  s.add_development_dependency 'activesupport', '~> 6.0', '>= 6.0'
  s.add_development_dependency 'rake', '~> 13.0.1', '>= 13.0.0'
  s.add_development_dependency 'rspec', '~> 3.10'
  s.add_development_dependency 'rspec-pride', '~> 3.2', '>= 3.2.0'
  s.add_development_dependency 'simplecov', '~> 0.7', '>= 0.7.1'
  s.add_development_dependency 'webmock', '~> 3.10.0', '>= 3.10.0'
end
