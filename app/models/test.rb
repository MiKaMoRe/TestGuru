class Test < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :delete_all
  has_many :users, through: :tests_users, dependent: :destroy

  validates :level, numericality: { only_integer: true, greater_than: -1 }
  validates :title, uniqueness: { scope: :level}

  scope :difficulty_level, -> (level = 0) {
    return where(level: (0..1)) if level == 'easy'
    return where(level: (2..4)) if level == 'normal'
    return where(level: (5..Float::INFINITY)) if level == 'hard'
  }

  scope :get_by_title, -> (title) {
    joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  }
end
