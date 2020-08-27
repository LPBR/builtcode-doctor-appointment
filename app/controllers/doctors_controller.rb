class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.select(:id, :name, :crm, :crm_uf).order(name: :asc)
  end
end
