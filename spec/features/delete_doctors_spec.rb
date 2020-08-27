require 'rails_helper'

RSpec.feature "DeleteDoctors", type: :feature do
  let!(:doctor) { create(:doctor) }

  scenario "Successfully deletes a doctor" do
    navigate_to_doctors_index

    click_on "Excluir"

    expect(page).to have_css ".toast-body", text: "Médico excluído com sucesso."
  end

  scenario "Unable to delete a doctor with associated patient" do
    create(:patient, doctor_id: doctor.id)

    navigate_to_doctors_index

    click_on "Excluir"

    expect(page).to have_css ".toast-body",
                             text: "Médico com pacientes associados não pode ser excluído."
  end
end
