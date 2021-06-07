class User < ApplicationRecord
  def complete_tests(level = 0)
    Test
      .select('tests.title')
      .joins('INNER JOIN results ON results.test_id == tests.id')
      .joins('INNER JOIN users ON results.user_id == users.id')
      .where('tests.level == :level AND users.id == :id', level: level, id: id)
  end
end
