class Specifications::Badges::CompleteCategory
  def initialize(test_passage, rule, rule_value)
    @user = test_passage.user
    @rule_value = rule_value
    @rule = rule
    @tests = Test.where(category_id: rule_value)
  end

  def satisfied_by?
    min_amount_passages = @tests.map do |test|
      test.test_passages.where(user: @user).length
    end.min
    
    @user.badges.where(rule_value: @rule_value, rule: @rule).length < min_amount_passages
  end
end
