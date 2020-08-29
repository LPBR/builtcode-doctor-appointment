class AppointmentsController < ApplicationController
  before_action :set_doctors, only: %i(new)
  before_action :set_patients, only: %i(new)

  def index
    @appointments = Appointment.order(starts_at: :desc)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.ends_at = @appointment.starts_at + 30.minutes

    if @appointment.save
      redirect_to appointments_path, alert: { success: "Consulta cadastrada com sucesso." }
    else
      set_doctors
      set_patients
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit %i(id starts_at patient_id doctor_id)
  end

  def set_doctors
    @doctors = Doctor.order(name: :asc)
  end

  def set_patients
    @patients = Patient.order(name: :asc)
  end
end
