class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: :author_id

  def self.get_tests(category_title)
    joins(:category)
      .select('title')
      .where('categories.title == :title', title: category_title)
      .order(title: :desc)
  end
end
