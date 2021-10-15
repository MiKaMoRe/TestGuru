class BadgeManager
  def self.rules
    {
      all_tests_by_category: Specifications::Badges::CompleteCategory,
      all_pass_first_test: Specifications::Badges::CompleteFirstTest
    }
  end

  def self.rules_list
    [
      :all_tests_by_category,
      :all_pass_first_test
    ]
  end

  def self.call(test_passage)
    added_badges = []
    Badge.find_each do |badge|
      specification = rules[badge.rule.to_sym].new(test_passage, badge.rule, badge.rule_value)
      if specification.satisfied_by?
        test_passage.user.add_badge(badge)
        added_badges << badge
      end
    end
    added_badges
  end
end
