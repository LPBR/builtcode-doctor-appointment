require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe "associations" do
    it { should belong_to(:doctor) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:cpf) }
    it { should validate_length_of(:cpf).is_equal_to(11) }
    it { should validate_uniqueness_of(:cpf).case_insensitive }
    it { is_expected.to allow_value("91418122041").for(:cpf) }
    it { is_expected.not_to allow_value("91418122040").for(:cpf) }
  end
end
