require 'rails_helper'

RSpec.feature "DisplayListOfRegisteredDoctors", type: :feature do
  scenario "Without registered doctors" do
    visit "/doctors"
    expect(page).to have_css ".empty-list", text: "Nenhum médico cadastrado"
  end

  scenario "With registered doctors" do
    doctor = create(:doctor)

    visit "/doctors"

    expect(page).to have_css "td", text: doctor.name
    expect(page).to have_css "td", text: "#{doctor.crm}/#{doctor.crm_uf}"
    expect(page).to have_link(href: edit_doctor_path(doctor))
    expect(page).to have_link(href: doctor_path(doctor))
  end
end
