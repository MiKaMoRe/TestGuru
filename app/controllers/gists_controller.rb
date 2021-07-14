class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    question = test_passage.current_question
    gist_question = GistQuestionService.new(question).call
                   
    if gist_question.success?
      gist = Gist.new(
                        question: question,
                        url: gist_question.html_url,
                        user: current_user.email
                      )
      flash[:notice] = gist_question.html_url
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passage
  end
end
