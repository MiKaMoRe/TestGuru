class QuestionsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @question = Question.find(params[:id])
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
