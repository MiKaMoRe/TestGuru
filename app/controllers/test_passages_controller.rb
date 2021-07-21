class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show
    unless @test_passage.current_question
      redirect_to tests_path(@test_passage.test)
    end
  end

  def result
    added_badges = BadgeManager.call(@test_passage)
    added_badges.each do |badge| 
      flash[:notice] = "Вы заслужили бейдж - #{badge.title}!"
    end
  end

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
end
