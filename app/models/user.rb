class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :confirmable,
         :trackable,
         :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, foreign_key: 'author_id', class_name: 'Test', dependent: :destroy

  validates :email, :nickname, presence: true
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def complete_tests(level = 0)
    Test
      .joins(:tests_users)
      .where(tests_users: { user_id: id }, level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
