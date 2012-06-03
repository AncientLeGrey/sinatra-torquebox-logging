# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sinatra/torquebox/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['AncientLeGrey']
  gem.email         = ['j.graumann@web.de']
  gem.description   = 'TorqueBox logger for Sinatra'
  gem.summary       = 'Sinatra extension to enable logging to the TorqueBox server.log'
  gem.homepage      = 'https://github.com/AncientLeGrey/sinatra-torquebox-logging'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'sinatra-torquebox-logging'
  gem.require_paths = ['lib']
  gem.version       = Sinatra::TorqueBox::Logging::VERSION

  gem.add_dependency 'torquebox'
  gem.add_dependency 'sinatra', '>= 1.3.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sinatra-contrib'
end
