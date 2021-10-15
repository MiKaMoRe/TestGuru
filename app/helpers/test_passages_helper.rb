module TestPassagesHelper
  def percent
    @test_passage.correct_percent
  end

  def passed
    if @test_passage.succesed?(percent)
      {
        class_name: 'passed',
        message: 'Test was passed'
      }
    else
      {
        class_name: 'not_passed',
        message: 'Test was not succesed'
      }
    end
  end
end
