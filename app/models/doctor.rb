class Doctor < ApplicationRecord
  validates_presence_of %i(name crm crm_uf)
  validates_length_of :name, maximum: 255
  validates_length_of :crm, minimum: 4, maximum: 10
  validates_length_of :crm_uf, is: 2
  validates_numericality_of :crm
  validates_uniqueness_of :crm, scope: [:crm_uf], case_sensitive: false

  has_many :patients, dependent: :restrict_with_error

  def full_crm
    "#{crm}/#{crm_uf}"
  end

  def name_with_full_crm
    "#{name}(#{full_crm})"
  end
end
