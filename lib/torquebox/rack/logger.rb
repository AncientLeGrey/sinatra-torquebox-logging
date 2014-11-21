module TorqueBox
  module Rack
    class Logger
      def initialize(app, level = ::Logger::INFO)
        @app, @level = app, level
      end

      def call(env)
        logger = TorqueBox::Logger.new
        logger.level = @level

        env['rack.logger'] = logger
        @app.call(env)
      end
    end
  end
end
