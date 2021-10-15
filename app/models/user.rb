class User < ApplicationRecord
  def complete_tests(level = 0)
    Test
      .joins('INNER JOIN results ON results.test_id == tests.id')
      .where(results: { user_id: id }, level: level)
  end
end
