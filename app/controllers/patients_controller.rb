class PatientsController < ApplicationController
  include Pagy::Backend

  before_action :set_doctors, only: %i(new edit)
  before_action :set_patient, only: %i(edit update destroy)

  def index
    @pagy, @patients = pagy(Patient.select(:id, :name, :cpf, :birth_date, :doctor_id).
                                   order(name: :asc).includes(:doctor))
    @patients = @patients.decorate
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to patients_path, alert: { success: "Paciente cadastrado com sucesso." }
    else
      set_doctors
      render :new
    end
  end

  def edit; end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, alert: { success: "Paciente atualizado com sucesso." }
    else
      set_doctors
      render :edit
    end
  end

  def destroy
    @patient.destroy

    redirect_to patients_path, alert: { success: "Paciente excluído com sucesso." }
  end

  private

  def patient_params
    params.require(:patient).permit %i(id name cpf birth_date doctor_id)
  end

  def set_patient
    @patient = Patient.find(params[:id]).decorate
  end

  def set_doctors
    @doctors = Doctor.order(name: :asc).decorate
  end
end
