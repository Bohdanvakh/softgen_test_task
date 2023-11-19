class PatientsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_patient!
  before_action :find_patient, only: [:show]

  has_scope :by_category

  def index
  end

  def show
    @doctors = apply_scopes(Doctor).all
    @appointments = @patient.appointments.includes(:doctor)
  end

  def find_patient
    @patient = Patient.find(params[:id])
  end
end
