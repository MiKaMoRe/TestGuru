class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index; end

  def show; end

  def new; end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to controller: 'questions', action: 'show', test_id: @question.test_id, id: @question.id
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to controller: 'questions', action: 'index'
  end

  private

  def find_question
    @question = Question.find(params['id'])
  end

  def find_test
    @test = Test.find(params['test_id'])
  end

  def question_params
    params.require(:question).permit(:description, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
