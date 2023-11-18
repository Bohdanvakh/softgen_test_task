class PatientsController < ApplicationController
  before_action :authenticate_patient!

  def index
  end

  def show
    @patient = Patient.find(params[:id])
  end
end
