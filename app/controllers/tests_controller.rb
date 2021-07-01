class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end
  
  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.build(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params['id'])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
