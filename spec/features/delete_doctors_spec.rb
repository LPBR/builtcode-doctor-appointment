require 'rails_helper'

RSpec.feature "DeleteDoctors", type: :feature do
  let!(:doctor) { create(:doctor) }

  scenario "Successfully deletes a doctor" do
    navigate_to_doctors_index

    click_on "Excluir"

    expect(page).to have_css ".toast-body", text: "Médico excluído com sucesso."
  end
end
