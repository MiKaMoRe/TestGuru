class Timer
  def self.set_time_out(time)
    @@scheduler = Rufus::Scheduler.new

    @@scheduler.in "#{time}s" do
      yield
    end
  end

  def self.time_has_passed
    @@scheduler.uptime.to_i
  end
end
