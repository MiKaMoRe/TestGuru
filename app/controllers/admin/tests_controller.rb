class Admin::TestsController < Admin::BaseController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params['id'])
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.build(test_params)
    if @test.save
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
