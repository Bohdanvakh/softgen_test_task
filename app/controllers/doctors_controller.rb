class DoctorsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_doctor!
  before_action :find_doctor, only: [:show]

  def index
  end

  def show
    @appointments = @doctor.appointments.includes(:patient).where(patients: { appointments: { recommendation: nil } })
  end

  private

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end
end
