class Timer
  attr_reader :start_time

  def initialize(seconds, start_time = Time.now)
    @seconds = seconds
    @start_time = start_time
  end

  def self.test_passage_time_passed(test_passage)
    full_time = test_passage.test.remaining_time
    start_time = test_passage.created_at
    full_time - (Time.now - start_time).to_i
  end

  def time_left
    time = @seconds - (Time.now - start_time).to_i
    time >= 0 ? time : 0
  end

  def time_has_passed?
    (Time.now - @start_time).to_i > @seconds
  end
end
