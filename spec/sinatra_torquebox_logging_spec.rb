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
      expect(settings.logging).to be true
    end

    it 'actually writes to TorqueBox::Logger' do
      expect(logger).to receive(:write).with('Sinatra::TorqueBox::Logging initialized')
      expect(logger).to receive(:write).with('log message')
      expect(logger).to receive(:write) # sinatras request logging
      get('/')
    end
  end

  context 'logging disabled' do
    before { settings.logging = false }

    it 'writes nothing' do
      expect(logger).not_to receive(:write)
      get('/')
    end
  end
end