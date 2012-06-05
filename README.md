[![Build Status](https://secure.travis-ci.org/AncientLeGrey/sinatra-torquebox-logging.png?branch=master)](http://travis-ci.org/AncientLeGrey/sinatra-torquebox-logging)

# Sinatra::TorqueBox::Logging

Sinatra uses Rack::CommonLogger by default, which writes to env['rack.errors'].
This Sinatra extension enables logging to the TorqueBox server.log

## Installation

Add this line to your application's Gemfile:

    gem 'sinatra-torquebox-logging', :git => 'git://github.com/AncientLeGrey/sinatra-torquebox-logging.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-torquebox-logging (not yet released on rubygems.org)

## Usage

    require 'sinatra/torquebox/logging'
    class MyApp < Sinatra::Base
      configure do
        register Sinatra::TorqueBox::Logging
      end
      get '/' do
        logger.info 'Message will show up in TorqueBox server.log'
      end
    end

## Todo
1. Avoid monkey patching sinatras internals
2. Add the ability to change the log level

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
