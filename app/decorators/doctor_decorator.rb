class DoctorDecorator < Draper::Decorator
  delegate_all

  def full_crm
    "#{object.crm}/#{object.crm_uf}"
  end

  def name_with_full_crm
    "#{object.name} (#{full_crm})"
  end
end
