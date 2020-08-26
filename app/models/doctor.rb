class Doctor < ApplicationRecord
  validates_presence_of %i(name crm crm_uf)
  validates_length_of :name, maximum: 255
  validates_length_of :crm, minimum: 4, maximum: 10
  validates_length_of :crm_uf, is: 2
end
