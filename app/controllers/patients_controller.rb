class PatientsController < ApplicationController
  before_action :set_patient, only: [:show]
  before_action :parse_date, only: [:create]

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      render json: { message: 'Patient created successfully' }, status: :ok
    else
      render json: { message: @patient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: { patient: @patient, results: @patient.results }, status: :ok
  end

  private

  def set_patient
    @patient = Patient.find_by(ic_number: params[:id])
    render json: { message: 'Patient not found' }, status: :not_found unless @patient
  end

  def parse_date
    params[:birth_of_date] = DateTime.strptime(params[:birth_of_date], '%m-%d-%Y')
  rescue StandardError
    render json: { message: 'Invalid date format' }, status: :unprocessable_entity
  end

  def patient_params
    params.permit(:name, :gender, :birth_of_date, :nationality, :email, :phone_number, :ic_number)
  end
end
