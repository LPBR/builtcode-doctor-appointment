FactoryBot.define do
  factory :appointment do
    starts_at do
      Faker::Time.between(from: 1.year.ago, to: 1.year.from_now).
        change(hour: 9, min: 0, sec: 0)
    end

    ends_at { starts_at + 30.minutes }

    association :patient, factory: :patient
    association :doctor, factory: :doctor
  end
end
