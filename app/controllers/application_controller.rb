class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  include Pundit


  # after_action :verify_authorized, unless: :devise_controller?
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
end
