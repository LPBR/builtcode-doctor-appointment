class DashboardController < ApplicationController
  def index
    @doctors = Doctor.order(name: :asc)

    doctor = Doctor.find(params[:doctor_id]) if params[:doctor_id].present?

    @dashboard = {
      appointments_carried_out_count: appointments_carried_out_count(doctor),
      appointments_count: appointments_count(doctor),
      patients_seen_count: patients_seen_count(doctor),
      patients_count: patients_count(doctor),
    }
  end

  private

  def appointments_carried_out_count(doctor)
    return doctor.appointments.carried_out.count if doctor.present?

    Appointment.carried_out.count
  end

  def appointments_count(doctor)
    return doctor.appointments.count if doctor.present?

    Appointment.count
  end

  def patients_seen_count(doctor)
    return doctor.patients.seen.uniq.count if doctor.present?

    Patient.seen.count
  end

  def patients_count(doctor)
    return doctor.patients.count if doctor.present?

    Patient.count
  end
end
