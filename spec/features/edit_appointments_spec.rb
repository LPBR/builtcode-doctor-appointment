require 'rails_helper'

RSpec.feature "EditAppointments", type: :feature do
  let!(:appointment) { create(:appointment) }
  let!(:doctor) { create(:doctor) }
  let!(:patient) { create(:patient) }

  scenario "Successfuly edits a appointment" do
    navigate_to_appointments_index

    click_on "Editar"

    select doctor.decorate.name_with_full_crm, from: "Médico"
    select patient.decorate.name_with_cpf, from: "Paciente"
    fill_in "Data e Hora",
            with: Faker::Time.between(from: DateTime.now, to: DateTime.now).
              change(hour: 9, min: 0, sec: 0)

    click_on "Salvar"

    expect(page).to have_css ".toast-body", text: "Consulta atualizada com sucesso."
  end

  scenario "With invalid attributes for appointment" do
    navigate_to_appointments_index

    click_on "Editar"

    select doctor.decorate.name_with_full_crm, from: "Médico"
    select patient.decorate.name_with_cpf, from: "Paciente"
    fill_in "Data e Hora",
            with: Faker::Time.between(from: DateTime.now, to: DateTime.now).
              change(hour: 8, min: 0, sec: 0)

    click_on "Salvar"

    expect(page).to have_css ".alert-danger"
  end
end
