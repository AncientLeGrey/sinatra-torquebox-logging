require 'sinatra/test_helpers'

RSpec.configure do |config|
  config.fail_fast = true
  config.include Sinatra::TestHelpers
end

module TorqueBox
  class Logger
    class << self
      def mock=(m)
        @@mock = m
      end
      def mock
        @@mock
      end
    end
    attr_accessor :level
    def info(message)
      @@mock.write message
    end
  end
end

require 'torquebox/rack/logger'
require 'torquebox/common_logger'
require 'sinatra/torquebox/logging/extension'

