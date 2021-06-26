module TestsHelper
  def test_count(test)
    test.questions.count
  end
end
