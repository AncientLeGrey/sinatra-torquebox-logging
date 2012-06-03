module TorqueBox
  class CommonLogger < Logger
    def write(msg)
      info msg.chop
    end
  end
end