require 'rails_helper'

RSpec.feature "CreatesPatient", type: :feature do
  scenario "Creates a new patient" do
    navigate_to_patients_index

    doctor = create(:doctor)

    click_on "Cadastrar"

    fill_in "Nome", with: Faker::FunnyName.four_word_name
    fill_in "CPF", with: Faker::IDNumber.brazilian_citizen_number
    fill_in "Data de Nascimento", with: Faker::Date.birthday(min_age: 18, max_age: 65)
    select doctor.decorate.name_with_full_crm, from: "Médico"

    click_on "Salvar"

    expect(page).to have_css ".toast-body", text: "Paciente cadastrado com sucesso."
  end
end
