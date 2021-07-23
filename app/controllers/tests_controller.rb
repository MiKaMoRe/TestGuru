class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show start]
  before_action :redirect_to_result, only: %i[start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    current_user.tests.push(@test)

    # У меня здесь не выходит выполнить второй redirect_to.
    # По моим представлениям выполнение блока в set_time_out асинхронное
    # и оно не должно конфликтовать с местным redirect_to.
    # Но и вызов через колбеки, и return все равно возвращает ошибку
    Timer.set_time_out(@test.remaining_time) do
      redirect_to result_test_passage_path(current_user.test_passage(@test)) and return
    end

    return redirect_to current_user.test_passage(@test)
  end
  
  private

  def find_test
    @test = Test.find(params['id'])
  end

  def redirect_to_result
    
  end
end
