class DoctorsController < ApplicationController
  before_action :authenticate_doctor!

  def index
  end

  def show
    @doctor = Doctor.find(params[:id])

    @appointments = @doctor.appointments.includes(:patient).where(patients: { appointments: { recommendation: nil } })
  end
end
