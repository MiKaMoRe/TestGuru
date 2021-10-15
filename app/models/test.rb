class Test < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  belongs_to :category

  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :level, numericality: { only_integer: true, greater_than: -1 }
  validates :title, uniqueness: { scope: :level }

  scope :easy, -> { where(level: (0..1)) }
  scope :normal, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }

  scope :get_by_category, -> (title) do
    joins(:category)
      .where(categories: { title: title })
      .order(title: :desc)
  end
end
