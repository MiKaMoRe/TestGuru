class User < ApplicationRecord
  def complete_tests(level = 0)
    Result
      .select('test_id')
      .where('user_id == :id', id: id)
      .filter_map do |result|
        Test
          .select('title')
          .where('id == :id AND level == :level', id: result.test_id, level: level)[0]
      end
  end
end
