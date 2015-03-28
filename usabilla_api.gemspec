$:.push File.expand_path('../lib', __FILE__)
require 'usabilla_api/version'

Gem::Specification.new do |s|
  s.name        = 'usabilla_api'
  s.version     = UsabillaApi::VERSION
  s.date        = '2015-03-19'
  s.summary     = "Ruby Usabilla API Gem."
  s.description = "A Ruby Usabilla API Gem that will allow you to connect to and use the Usabilla API"
  s.authors     = ["Jon Molinaro"]
  s.email       = 'Teirson@gmail.com'
  s.files       = ["lib/usabilla_api.rb"]
  s.homepage    = 'http://rubygems.org/gems/usabilla_api'
  s.license     = 'MIT'

  s.add_dependency 'rest-client', '~> 1.7'
  s.add_dependency 'json', '~> 1.7', '>= 1.7.7'
end