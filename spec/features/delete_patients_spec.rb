require 'rails_helper'

RSpec.feature "DeletePatients", type: :feature do
  let!(:patient) { create(:patient) }

  scenario "Successfully deletes a patient" do
    navigate_to_patients_index

    click_on "Excluir"

    expect(page).to have_css ".toast-body", text: "Paciente excluído com sucesso."
  end

  scenario "Can't delete a patient with appointments" do
    navigate_to_patients_index

    create(:appointment, patient: patient)

    click_on "Excluir"

    expect(page).to have_css ".toast-body", text: "Paciente com consultas não pode ser excluído."
  end
end
