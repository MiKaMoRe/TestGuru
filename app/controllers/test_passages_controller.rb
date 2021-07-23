class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]
  before_action :set_time_left, only: %i[show update]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params['answer_ids'])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params['id'])
  end

  def set_time_left
    @time_left = @test_passage.test.remaining_time * 60 - Timer.time_has_passed
  end
end
