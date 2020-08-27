require 'rails_helper'

RSpec.feature "DisplayListOfRegisteredAppontments", type: :feature do
  scenario "Without registered appointments" do
    navigate_to_appointments_index

    expect(page).to have_css ".empty-list", text: "Nenhuma consulta cadastrada"
  end

  scenario "With registered appointment" do
    appointment = create(:appointment)

    navigate_to_appointments_index

    expect(page).to have_link(href: edit_appointment_path(appointment))
    expect(page).to have_link(href: appointment_path(appointment))
  end
end
