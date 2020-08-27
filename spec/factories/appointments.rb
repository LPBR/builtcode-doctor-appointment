FactoryBot.define do
  factory :appointment do
    starts_at do
      Faker::Time.between(from: DateTime.now, to: DateTime.now).
        change(hour: 9, min: 0, sec: 0)
    end

    ends_at do
      Faker::Time.between(from: DateTime.now, to: DateTime.now).
        change(hour: 9, min: 30, sec: 0)
    end

    association :patient, factory: :patient
    association :doctor, factory: :doctor
  end
end
