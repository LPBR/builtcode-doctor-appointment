require 'rails_helper'

RSpec.describe DoctorDecorator, type: :decorator do
  subject { create(:doctor).decorate }

  describe "#full_crm" do
    it "returns the crm and the crm_uf separeted by a '/'" do
      expect(subject.full_crm).to eq("#{subject.crm}/#{subject.crm_uf}")
    end
  end

  describe "#name_with_full_crm" do
    it "returns the name and the full_crm inside brackets" do
      expect(subject.name_with_full_crm).to eq("#{subject.name} (#{subject.full_crm})")
    end
  end
end
