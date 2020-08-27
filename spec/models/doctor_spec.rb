require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe "associations" do
    it { should have_many(:patients) }
    it { should have_many(:appointments) }
  end

  describe "validations" do
    subject { create(:doctor) }

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should validate_presence_of(:crm) }
    it { should validate_numericality_of(:crm) }
    it { should validate_length_of(:crm).is_at_least(4).is_at_most(10) }
    it { should validate_presence_of(:crm_uf) }
    it { should validate_length_of(:crm_uf).is_equal_to(2) }
    it { should validate_uniqueness_of(:crm).scoped_to(:crm_uf).case_insensitive }
  end

  describe "#full_crm" do
    it "returns the crm and the crm_uf separeted by a '/'" do
      expect(subject.full_crm).to eq("#{subject.crm}/#{subject.crm_uf}")
    end
  end

  describe "#name_with_full_crm" do
    it "returns the name and the full_crm inside brackets" do
      expect(subject.name_with_full_crm).to eq("#{subject.name}(#{subject.full_crm})")
    end
  end
end
