FactoryBot.define do
  factory :patient do
    name { Faker::FunnyName.four_word_name }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    cpf { Faker::IDNumber.brazilian_citizen_number }
  end
end
