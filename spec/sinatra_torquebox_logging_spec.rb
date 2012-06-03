require 'spec_helper.rb'

describe Sinatra::TorqueBox::Logging do
  let(:logger) { TorqueBox::Logger::mock = double() }

  before do
    mock_app do
      register Sinatra::TorqueBox::Logging
      get('/') { logger.info 'log message' }
    end
  end

  context 'by default' do
    it 'enables logging' do
      settings.logging.should be_true
    end

    it 'actually writes to TorqueBox::Logger' do
      logger.should_receive(:write).with('Sinatra::TorqueBox::Logging initialized')
      logger.should_receive(:write).with('log message')
      logger.should_receive(:write) # sinatras request logging
      get('/')
    end
  end

  context 'logging disabled' do
    before { settings.logging = false }

    it 'writes nothing' do
      logger.should_not_receive(:write)
      get('/')
    end
  end
end