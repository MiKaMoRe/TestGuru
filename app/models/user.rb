class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy

  validates :email, :name, presence: true
  validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def complete_tests(level = 0)
    Test
      .joins(:tests_users)
      .where(tests_users: { user_id: id }, level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
