class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show
    time_has_passed = Timer.test_passage_time_passed(@test_passage)
    @timer = Timer.new(time_has_passed)
  end

  def result; end

  def update
    time_has_passed = Timer.test_passage_time_passed(@test_passage)
    @timer = Timer.new(time_has_passed, @test_passage.created_at)
    @test_passage.accept!(params['answer_ids'])

    if  @timer.time_has_passed?
      redirect_to result_test_passage_path(@test_passage) and return
    end

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage) and return
    else
      return render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params['id'])
  end
end
