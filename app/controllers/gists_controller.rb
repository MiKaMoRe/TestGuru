class GistsController < ApplicationController
  def create
    question = TestPassage.find(params[:test_passage_id]).current_question
    gist_question = GistQuestionService.new(question).call
    if gist_question.success?
      Gist.create!(
                    question: question,
                    url: gist_question.html_url,
                    user: current_user.email
                  )
      flash[:notice] = "<a href=#{gist_question.html_url}>#{gist_question.html_url}</a>"
    else
      flash[:alert] = t('.failure')
    end

    redirect_to TestPassage.find(params[:test_passage_id])
  end
end
