class PatientDecorator < Draper::Decorator
  delegate_all

  decorates_association :doctor

  def cpf
    _cpf = object.cpf.clone
    _cpf.insert(3, '.').insert(7, '.').insert(11, '-') if _cpf.present?
  end

  def name_with_cpf
    "#{object.name} (#{cpf})"
  end
end
