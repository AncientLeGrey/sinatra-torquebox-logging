module Sinatra
  module TorqueBox
    module Logging
      # This is a monkey patch! Sinatra 1.3 exposes logger with a helper method
      # https://github.com/sinatra/sinatra/blob/1.3.0/CHANGES#L37
      # TODO: find a better way for doing that
      def setup_logging(builder)
        if logging?
          common_logger = ::TorqueBox::CommonLogger.new
          builder.use Rack::CommonLogger, common_logger
          builder.use ::TorqueBox::Rack::Logger
          common_logger.info 'Sinatra::TorqueBox::Logging initialized'
        else
          builder.use Rack::NullLogger
        end
      end

      def self.registered(app)
        app.enable :logging
      end
    end
  end

  register TorqueBox::Logging
end