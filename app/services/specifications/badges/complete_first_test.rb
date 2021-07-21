class Specifications::Badges::CompleteFirstTest
  def initialize(test_passage, rule, rule_value)
    @user = test_passage.user
    @rule_value = rule_value
    @rule = rule
  end

  def satisfied_by?
    @user.test_passages.length == 1
  end
end
