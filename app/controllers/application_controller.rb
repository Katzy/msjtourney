class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  before_filter :initialize_users_for_header

  def configure_devise_permitted_parameters
    registration_params = [:email, :name, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) {
        |u| u.permit(registration_params)
      }
    end
  end

  def initialize_users_for_header
    current_user
    @users = User.order('school ASC')
    @wrestlers = Wrestler.order('weight ASC')
    @applicant = Applicant.new

  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def authorize_admin
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end

  def require_admin!
    unless user_signed_in? && current_user.admin?
      redirect_to root_url, alert: "You do not have permission!"
    end
  end
end
