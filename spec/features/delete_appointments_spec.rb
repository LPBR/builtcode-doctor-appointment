require 'rails_helper'

RSpec.feature "DeleteAppointments", type: :feature do
  let!(:appointment) { create(:appointment) }

  scenario "Successfully deletes a appointment" do
    navigate_to_appointments_index

    click_on "Excluir"

    expect(page).to have_css ".toast-body", text: "Consulta excluída com sucesso."
  end
end
