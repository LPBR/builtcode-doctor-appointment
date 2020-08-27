module Features
  def navigate_to_patients_index
    visit "/"
    click_on "Pacientes"
  end
end
