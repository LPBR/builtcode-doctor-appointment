class PatientsController < ApplicationController
  def index
    @patients = Patient.select(:id, :name, :cpf, :birth_date, :doctor_id).includes(:doctor).
      order(name: :asc)
  end
end
