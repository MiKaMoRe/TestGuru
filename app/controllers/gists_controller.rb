class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:test_passage_id])
    question = test_passage.current_question
    gist_question = GistQuestionService.new(question).call
    debugger
    if gist_question.success?
      Gist.new(
                question: question,
                url: gist_question.html_url,
                user: current_user.email
              ).call
      flash[:notice] = "<a href=#{gist_question.html_url}>#{gist_question.html_url}</a>"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to test_passage
  end
end
