require 'rails_helper'

RSpec.feature "DisplayListOfRegisteredPatients", type: :feature do
  scenario "Without registered patients" do
    navigate_to_patients_index

    expect(page).to have_css ".empty-list", text: "Nenhum paciente cadastrado"
  end

  scenario "With registered patient" do
    patient = create(:patient).decorate

    navigate_to_patients_index

    expect(page).to have_css "td", text: patient.name
    expect(page).to have_css "td", text: patient.cpf
    expect(page).to have_css "td", text: patient.birth_date.strftime("%d/%m/%Y")
    expect(page).to have_link(href: edit_patient_path(patient))
    expect(page).to have_link(href: patient_path(patient))
  end
end
