require 'rails_helper'

RSpec.feature "EditPatients", type: :feature do
  let!(:patient) { create(:patient) }

  scenario "Successfuly edits a patient" do
    navigate_to_patients_index

    click_on "Editar"

    fill_in "Nome", with: Faker::FunnyName.four_word_name
    fill_in "CPF", with: Faker::IDNumber.brazilian_citizen_number
    fill_in "Data de Nascimento", with: Faker::Date.birthday(min_age: 18, max_age: 65)

    click_on "Salvar"

    expect(page).to have_css ".toast-body", text: "Paciente atualizado com sucesso."
  end

  scenario "With invalid attributes for patient" do
    navigate_to_patients_index

    click_on "Editar"

    fill_in "Nome", with: Faker::Lorem.characters(number: 256)
    fill_in "CPF", with: "00000000000"
    fill_in "Data de Nascimento", with: Faker::Date.birthday(min_age: 18, max_age: 65)

    click_on "Salvar"

    expect(page).to have_css ".alert-danger"
  end
end
