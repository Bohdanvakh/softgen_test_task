class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to permission_denied_path, error: exception.message
  end

  def current_ability
    user = current_patient || current_doctor
    @current_ability ||= ::Ability.new(user)
  end
end
