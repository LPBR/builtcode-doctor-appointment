FactoryBot.define do
  factory :doctor do
    name { Faker::FunnyName.four_word_name }
    crm { Faker::Number.leading_zero_number(digits: 10) }
    crm_uf { Faker::Name.initials(number: 2) }
  end
end
