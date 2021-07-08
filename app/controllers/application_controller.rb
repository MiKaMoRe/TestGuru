class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.first_name
      flash[:notice] = "Привет, #{current_user.first_name} #{current_user.last_name}"
    end
    admin_tests_path if resource.is_a?(Admin)
    tests_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
