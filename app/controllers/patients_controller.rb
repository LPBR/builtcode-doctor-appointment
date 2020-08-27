class PatientsController < ApplicationController
  before_action :set_patient, only: %i(edit update destroy)

  def index
    @patients = Patient.select(:id, :name, :cpf, :birth_date).order(name: :asc)
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

  def edit; end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, alert: { success: "Paciente atualizado com sucesso." }
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy

    redirect_to patients_path, alert: { success: "Paciente excluído com sucesso." }
  end

  private

  def patient_params
    params.require(:patient).permit %i(id name cpf birth_date)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
