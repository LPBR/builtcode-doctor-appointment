class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i(edit update destroy)

  def index
    @doctors = Doctor.select(:id, :name, :crm, :crm_uf).order(name: :asc)
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_path, alert: { success: "Médico cadastrado com sucesso." }
    else
      render :new
    end
  end

  def edit; end

  def update
    if @doctor.update(doctor_params)
      redirect_to doctors_path, alert: { success: "Médico atualizado com sucesso." }
    else
      render :edit
    end
  end

  def destroy
    if @doctor.destroy
      redirect_to doctors_path, alert: { success: "Médico excluído com sucesso." }
    else
      redirect_to doctors_path,
                  alert: { error: "Médico com pacientes associados não pode ser excluído." }
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit %i(id name crm crm_uf)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end
end
