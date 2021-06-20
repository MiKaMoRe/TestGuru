class QuestionsController < ApplicationController
  before_action :find_questions, only: %i[index show]
  before_action :find_answers, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show; end

  def new; end

  def create
    Question.create!(question_params)
  end

  def destroy
    Question.find(params['id']).destroy
  end

  private

  def find_questions
    @questions = Question.where(test_id: params['test_id'])
  end

  def find_answers
    @answers = @questions
               .select('questions.description as question_description, answers.description as answer_description')
               .where(id: params['id'])
               .joins(:answers)
    @answers.find(params['id'])
  end

  def question_params
    params.require(:question).permit(:description, :test_id)
  end

  def question_params_destroy
    params.require(:question).permit(:id)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
