class Test < ApplicationRecord
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, foreign_key: 'author_id', class_name: 'User', validate: true
  belongs_to :category

  def self.get_tests(category_title)
    joins('INNER JOIN categories ON categories.id == tests.category_id')
      .where('categories.title == :title', title: category_title)
      .order(title: :desc)
      .pluck(:title)
  end
end
