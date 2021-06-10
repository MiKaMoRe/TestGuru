class Test < ApplicationRecord
  def self.get_tests(category_title)
    joins('INNER JOIN categories ON categories.id == tests.category_id')
      .where('categories.title == :title', title: category_title)
      .order(title: :desc)
      .map { |test| test.title }
  end
end
