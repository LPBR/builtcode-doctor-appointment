class DoctorsController < ApplicationController
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

  private

  def doctor_params
    params.require(:doctor).permit %i(id name crm crm_uf)
  end
end
