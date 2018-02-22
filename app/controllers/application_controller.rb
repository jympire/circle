class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_filter :redirect_to_https

  def redirect_to_https
    redirect_to :protocol => "https://" unless request.ssl?
  end
  
  protected
  
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :title, :description, :certification, :certification_number, :insurance, :insurance_number, :school, :degree, :phone_number, :location, :interests])
  end
end
