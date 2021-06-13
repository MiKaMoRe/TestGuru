class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test'

  def complete_tests(level = 0)
    Test
      .joins('INNER JOIN results ON results.test_id == tests.id')
      .where(results: { user_id: id }, level: level)
  end
end
