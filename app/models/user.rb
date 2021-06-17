class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :delete_all
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy

  validates :name, :login, :password, presence: true

  def complete_tests(level = 0)
    Test
      .joins(:tests_users)
      .where(tests_users: { user_id: id }, level: level)
  end
end
