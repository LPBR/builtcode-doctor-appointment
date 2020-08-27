require 'rails_helper'

RSpec.feature "DeletePatients", type: :feature do
  let!(:patient) { create(:patient) }

  scenario "Successfully deletes a patient" do
    navigate_to_patients_index

    click_on "Excluir"

    expect(page).to have_css ".toast-body", text: "Paciente excluído com sucesso."
  end
end
