class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to permission_denied_path, error: exception.message
  end

  def current_ability
    user = current_patient || current_doctor
    @current_ability ||= ::Ability.new(user)
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(Doctor)
      doctor_path(resource)
    elsif resource.is_a?(Patient)
      patient_path(resource)
    else
      super
    end
  end
end
