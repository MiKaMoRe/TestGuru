class User < ApplicationRecord
  def complete_tests(level = 0)
    Result
      .joins(:test, :user)
      .select('tests.title')
      .where('users.id == :id AND tests.level == :level', id: id, level: level)
  end
end
