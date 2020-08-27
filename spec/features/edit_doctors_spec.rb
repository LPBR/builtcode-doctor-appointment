require 'rails_helper'

RSpec.feature "EditDoctors", type: :feature do
  let!(:doctor) { create(:doctor) }

  scenario "Successfuly edits a doctor" do
    navigate_to_doctors_index

    click_on "Editar"

    fill_in "Nome", with: Faker::FunnyName.four_word_name
    fill_in "CRM", with: Faker::Number.leading_zero_number(digits: 10)
    fill_in "UF do CRM", with: Faker::Name.initials(number: 2)

    click_on "Salvar"

    expect(page).to have_css ".toast-body", text: "Médico atualizado com sucesso."
  end

  scenario "With invalid attributes for doctor" do
    navigate_to_doctors_index

    click_on "Editar"

    fill_in "Nome", with: Faker::Lorem.characters(number: 256)
    fill_in "CRM", with: Faker::Name.initials(number: 4)
    fill_in "UF do CRM", with: Faker::Name.initials(number: 3)

    click_on "Salvar"

    expect(page).to have_css ".alert-danger"
  end
end
