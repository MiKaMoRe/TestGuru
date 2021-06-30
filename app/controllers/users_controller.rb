class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if !@user.email_valid?
      flash.now[:alert] = 'Incorrect email format'
      render :new
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to session[:target]
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
