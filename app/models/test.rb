class Test < ApplicationRecord
  def self.get_tests(category_title)
    Category
      .select('id, title')
      .where('categories.title == :title', title: category_title)
      .map do |category|
        return [] if category.nil?

        self
          .select('title')
          .where('category_id == :id', id: category.id)
          .order(title: :desc)
      end
  end
end
