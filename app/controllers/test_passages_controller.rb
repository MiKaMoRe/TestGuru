class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params['answer_ids'])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      current_question = @test_passage.current_question
      gist_question = GistQuestionService.new(current_question).call
      gist = Gist.new(
                      question: current_question, 
                      url: gist_question.html_url,
                      user: current_user.email
                    )
                    
      if gist.save
        flash[:notice] = gist_question.html_url
        render :show
      else
        redirect_to current_question
      end
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params['id'])
  end
end
