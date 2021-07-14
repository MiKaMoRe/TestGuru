class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    question = test_passage.current_question
    gist_question = GistQuestionService.new(question).call
    gist = Gist.new(
                      question: question,
                      url: gist_question.url,
                      user: current_user.email
                   )
                   
    if !gist_question.nil? && !gist_question.url.nil? && gist.save
      flash[:notice] = gist_question.url
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passage
  end
end
