class Patient < ApplicationRecord
  has_many :appointments, dependent: :restrict_with_error
  has_many :doctors, through: :appointments

  validates :name, length: { maximum: 255 }, presence: true
  validates :birth_date, presence: true
  validates :cpf, length: { is: 11 }, presence: true, uniqueness: { case_sensitive: false }
  validates :cpf, cpf_check_digit: { allow_blank: true }

  scope :seen, -> { joins(:appointments).where("appointments.ends_at <= ?", DateTime.now) }

  def name_with_cpf
    "#{name}(#{cpf})"
  end
end
