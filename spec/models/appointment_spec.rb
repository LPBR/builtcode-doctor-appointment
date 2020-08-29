require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe "associations" do
    it { should belong_to(:doctor) }
    it { should belong_to(:patient) }
  end

  describe "validations" do
    it { should validate_presence_of(:starts_at) }
    it { should validate_uniqueness_of(:starts_at).scoped_to(:doctor_id) }
    it { should validate_presence_of(:ends_at) }
    it { should validate_uniqueness_of(:ends_at).scoped_to(:doctor_id) }

    it "validates starts_at 09:00 - 11:30, 13:00 - 18:00" do
      is_expected.to allow_value(DateTime.new(2020, 10, 20, 9, 0, 0, "-0300")).for(:starts_at)
      is_expected.to allow_value(DateTime.new(2020, 10, 20, 11, 30, 0, "-0300")).for(:starts_at)
      is_expected.to allow_value(DateTime.new(2020, 10, 20, 13, 0, 0, "-0300")).for(:starts_at)
      is_expected.to allow_value(DateTime.new(2020, 10, 20, 17, 30, 0, "-0300")).for(:starts_at)

      is_expected.not_to allow_value(DateTime.new(2020, 10, 20, 8, 30, 0, "-0300")).for(:starts_at)
      is_expected.not_to allow_value(DateTime.new(2020, 10, 20, 12, 0, 0, "-0300")).for(:starts_at)
      is_expected.not_to allow_value(DateTime.new(2020, 10, 20, 12, 30, 0, "-0300")).for(:starts_at)
      is_expected.not_to allow_value(DateTime.new(2020, 10, 20, 18, 0, 0, "-0300")).for(:starts_at)
    end

    it "validates ends_at 09:30 - 12:00, 13:30 - 18:00" do
      is_expected.to allow_value(DateTime.new(2020, 10, 20, 9, 30, 0, "-0300")).for(:ends_at)
      is_expected.to allow_value(DateTime.new(2020, 10, 20, 12, 0, 0, "-0300")).for(:ends_at)
      is_expected.to allow_value(DateTime.new(2020, 10, 20, 13, 30, 0, "-0300")).for(:ends_at)
      is_expected.to allow_value(DateTime.new(2020, 10, 20, 18, 0, 0, "-0300")).for(:ends_at)

      is_expected.not_to allow_value(DateTime.new(2020, 10, 20, 9, 0, 0, "-0300")).for(:ends_at)
      is_expected.not_to allow_value(DateTime.new(2020, 10, 20, 12, 30, 0, "-0300")).for(:ends_at)
      is_expected.not_to allow_value(DateTime.new(2020, 10, 20, 13, 0, 0, "-0300")).for(:ends_at)
      is_expected.not_to allow_value(DateTime.new(2020, 10, 20, 18, 30, 0, "-0300")).for(:ends_at)
    end
  end

  describe "#valid_starts" do
    it "returns a range of valid starts_at with 30 minutes setps" do
      appointment = create(:appointment, patient: create(:patient), doctor: create(:doctor))

      expect(appointment.valid_starts).to match_array([
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 09:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 09:30:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 10:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 10:30:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 11:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 11:30:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 13:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 13:30:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 14:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 14:30:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 15:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 15:30:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 16:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 16:30:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 17:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 17:30:00 -0300",
      ].map(&:to_time))
    end
  end

  describe "#valid_ends" do
    it "returns a range of valid ends_at with 30 minutes setps" do
      appointment = create(:appointment, patient: create(:patient), doctor: create(:doctor))

      expect(appointment.valid_ends).to match_array([
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 09:30:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 10:00:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 10:30:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 11:00:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 11:30:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 12:00:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 13:30:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 14:00:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 14:30:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 15:00:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 15:30:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 16:00:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 16:30:00 -0300",
        "#{appointment.ends_at.strftime("%Y-%m-%d")} 17:00:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 17:30:00 -0300",
        "#{appointment.starts_at.strftime("%Y-%m-%d")} 18:00:00 -0300",
      ].map(&:to_time))
    end
  end
end
