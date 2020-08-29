require 'rails_helper'

RSpec.feature "Dashboards", type: :feature do
  scenario "Without any appointments" do
    visit "/"

    expect(page).to have_css ".appointments-count", text: "0"
    expect(page).to have_css ".patients-count", text: "0"
  end

  scenario "Without any doctor filter selected, display data for all doctors" do
    patient = create(:patient)
    create(:appointment, patient: patient,
                         starts_at: (DateTime.now - 1.day).change(hour: 9, min: 0, sec: 0))
    create(:appointment, patient: patient,
                         starts_at: (DateTime.now - 1.day).change(hour: 9, min: 30, sec: 0))
    create(:appointment, starts_at: (DateTime.now + 1.day).change(hour: 9, min: 30, sec: 0))

    visit "/"

    expect(page).to have_css ".appointments-carried-out-count p", text: "2"
    expect(page).to have_css ".appointments-count p", text: "3"

    expect(page).to have_css ".patients-seen-count p", text: "2"
    expect(page).to have_css ".patients-count p", text: "2"
  end

  scenario "With a doctor filter selected" do
    doctor = create(:doctor)
    patient = create(:patient)
    create(:appointment, starts_at: (DateTime.now - 2.day).change(hour: 9, min: 30, sec: 0))
    create(:appointment, patient: patient, doctor: doctor,
                         starts_at: (DateTime.now - 1.day).change(hour: 9, min: 0, sec: 0))

    create(:appointment, patient: patient, doctor: doctor,
                         starts_at: (DateTime.now - 1.day).change(hour: 9, min: 30, sec: 0))

    visit "/"

    select doctor.name_with_full_crm, from: "Médico"

    click_on "Filtrar"

    expect(page).to have_css ".appointments-count p", text: "2"
    expect(page).to have_css ".appointments-carried-out-count p", text: "2"

    expect(page).to have_css ".patients-seen-count p", text: "1"
    expect(page).to have_css ".patients-count p", text: "2"
  end
end
