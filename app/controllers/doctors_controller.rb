class DoctorsController < ApplicationController
  before_action :authenticate_doctor!

  def index
  end

  def show
    @doctor = Doctor.find(params[:id])
    @patients = @doctor.patients.includes(:appointments)
  end
end
