require 'rails_helper'

RSpec.describe PatientDecorator do
  subject { create(:patient).decorate }

  describe "#name_with_cpf" do
    it "returns the name and the cpf inside brackets" do
      expect(subject.name_with_cpf).to eq("#{subject.name} (#{subject.cpf})")
    end
  end
end
