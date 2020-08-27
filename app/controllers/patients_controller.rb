class PatientsController < ApplicationController
  before_action :set_doctors, only: %i(new)

  def index
    @patients = Patient.select(:id, :name, :cpf, :birth_date, :doctor_id).includes(:doctor).
      order(name: :asc)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patients_path, alert: { success: "Paciente cadastrado com sucesso." }
    else
      render :new
    end
  end

  private

  def patient_params
    params.require(:patient).permit %i(id name cpf birth_date doctor_id)
  end

  def set_doctors
    @doctors = Doctor.select(:id, :name, :crm, :crm_uf).order(name: :asc)
  end
end
