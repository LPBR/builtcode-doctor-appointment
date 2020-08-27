class Patient < ApplicationRecord
  validates :name, length: { maximum: 255 }, presence: true
  validates :birth_date, presence: true
  validates :cpf, length: { is: 11 }, presence: true
  validates :cpf, cpf_check_digit: { allow_blank: true }

  belongs_to :doctor
end
