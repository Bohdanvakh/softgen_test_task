class AppointmentsController < ApplicationController
  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_params)
      redirect_to doctor_path(current_doctor)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:recommendation)
  end
end
