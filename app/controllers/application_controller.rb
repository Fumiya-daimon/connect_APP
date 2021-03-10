class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
      user_path(id: current_user.id)
    elsif current_company
      company_path(id: current_company.id)
    end
  end

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end

  protected
    def configure_permitted_parameters
      if resource_class == User
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :skill, :image, :job])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :skill, :image, :job])
      elsif resource_class == Company
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :industry, :required_person])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :industry, :required_person])
      end
    end

    config.time_zone = 'Tokyo'
end