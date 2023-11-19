# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Doctor)
      can [:edit, :update], Appointment
      can :index, Doctor
      can :show, Doctor, id: user.id

    elsif user.is_a?(Patient)
      can [:new, :create], Appointment
      can :index, Patient
      can :show, Patient, id: user.id
    end
  end
end
