class ResultsController < ApplicationController
  before_action :parse_date, only: [:create]
  before_action :set_patient, only: [:create]
  before_action :set_result, only: [:show]

  def create
    ActiveRecord::Base.transaction do
      @result = @patient.results.create!(result_params)
      @result.lab_studies.create!(study_params)
    end
    render json: { message: "Result with id: #{@result.id} created successfully" }, status: :ok
  rescue ActiveRecord::RecordInvalid => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  def show
    render json: { result: @result, lab_studies: @result.lab_studies }, status: :ok
  end

  private

  def set_result
    @result = Result.find_by_id(params[:id])
    render json: { message: 'Result not found' }, status: :not_found unless @result
  end

  def set_patient
    @patient = Patient.find_by(ic_number: params[:ic_number])
    render json: { message: 'Patient not found' }, status: :not_found unless @patient
  end

  def result_params
    params.permit(:lab_id, :lab_code, :tested_at)
  end

  def study_params
    params.require(:lab_studies).map do |study|
      study.permit(:code, :name, :reference_range, :observation_value)
    end
  end

  def parse_date
    params[:tested_at] = DateTime.strptime(params[:tested_at], '%m-%d-%Y %H:%M')
  rescue StandardError
    render json: { message: 'Invalid date format' }, status: :unprocessable_entity
  end
end
