class AppointmentsController < ApplicationController
  load_and_authorize_resource

  before_action :find_appointment, only: [:edit, :update]

  def new
    @appointment = Appointment.new
    @doctor_id = params[:doctor_id]
    @doctor = Doctor.find_by(id: @doctor_id)
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to patient_path(current_patient.id), notice: "Appointment was successfully created."
    else
      redirect_to patient_path(current_patient.id), alert: "You can't create appointment with this doctor. The doctor has max number of appointments."
    end
  end

  def edit
    if @appointment.doctor_id != current_doctor.id
      redirect_to doctor_path(current_doctor)
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to doctor_path(current_doctor)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :appointment_date, :recommendation)
  end

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end
end
