class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :starts_at, inclusion: { in: :valid_starts }, presence: true
  validates :ends_at, inclusion: { in: :valid_ends }, presence: true
  validates :starts_at, uniqueness: true
  validates :ends_at, uniqueness: true

  def valid_starts
    _starts_at = starts_at || Date.today

    first_valid_interval = Range.new(
      DateTime.new(_starts_at.year, _starts_at.month, _starts_at.day, 9, 0, 0, "-0300").to_i,
      DateTime.new(_starts_at.year, _starts_at.month, _starts_at.day, 11, 30, 0, "-0300").to_i
    ).step(30.minutes).map { |date| Time.at(date) }

    second_valid_interval = Range.new(
      DateTime.new(_starts_at.year, _starts_at.month, _starts_at.day, 13, 0, 0, "-0300").to_i,
      DateTime.new(_starts_at.year, _starts_at.month, _starts_at.day, 17, 30, 0, "-0300").to_i
    ).step(30.minutes).map { |date| Time.at(date) }

    first_valid_interval | second_valid_interval
  end

  def valid_ends
    _ends_at = ends_at || Date.today
    

    first_valid_interval = Range.new(
      DateTime.new(_ends_at.year, _ends_at.month, _ends_at.day, 9, 30, 0, "-0300").to_i,
      DateTime.new(_ends_at.year, _ends_at.month, _ends_at.day, 12, 0, 0, "-0300").to_i
    ).step(30.minutes).map { |date| Time.at(date) }

    second_valid_interval = Range.new(
      DateTime.new(_ends_at.year, _ends_at.month, _ends_at.day, 13, 30, 0, "-0300").to_i,
      DateTime.new(_ends_at.year, _ends_at.month, _ends_at.day, 18, 0, 0, "-0300").to_i
    ).step(30.minutes).map { |date| Time.at(date) }

    first_valid_interval | second_valid_interval
  end
end
