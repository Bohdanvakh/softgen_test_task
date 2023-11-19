class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validate :valid_appointments_count, on: :create

  def valid_appointments_count
    if doctor.appointments.where(recommendation: nil).count >= 10
      errors.add(:base, "Doctor currently has the maximum number of appointments")
    end
  end
end
