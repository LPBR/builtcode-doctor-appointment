FactoryBot.define do
  factory :doctor do
    name { Faker::FunnyName.four_word_name }
    crm { Faker::IDNumber.brazilian_id }
    crm_uf { Faker::Name.initials(number: 2) }
  end
end
