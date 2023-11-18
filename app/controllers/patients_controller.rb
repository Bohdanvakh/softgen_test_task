class PatientsController < ApplicationController
  before_action :authenticate_patient!

  has_scope :by_category

  def index
  end

  def show
    @patient = Patient.find(params[:id])
    @doctors = apply_scopes(Doctor).all
  end
end
