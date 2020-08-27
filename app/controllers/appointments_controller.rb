class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.order(starts_at: :desc)
  end
end
