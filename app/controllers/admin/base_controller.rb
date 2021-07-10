class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  def after_sign_in_path_for(resource)
    admin_tests_path
  end

  private

  def admin_required!
    redirect_to root_path, alert: 'You are not admin!' unless current_user.is_a?(Admin)
  end
end
