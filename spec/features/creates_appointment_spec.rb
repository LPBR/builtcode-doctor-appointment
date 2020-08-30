require 'rails_helper'

RSpec.feature "CreatesAppointment", type: :feature do
  let!(:doctor) { create(:doctor) }
  let!(:patient) { create(:patient) }

  scenario "Creates a new patient" do
    navigate_to_appointments_index

    click_on "Cadastrar"

    select doctor.decorate.name_with_full_crm, from: "Médico"
    select patient.decorate.name_with_cpf, from: "Paciente"
    fill_in "Data e Hora",
            with: Faker::Time.between(from: DateTime.now, to: DateTime.now).
              change(hour: 9, min: 0, sec: 0)

    click_on "Salvar"

    expect(page).to have_css ".toast-body", text: "Consulta cadastrada com sucesso."
  end
end
