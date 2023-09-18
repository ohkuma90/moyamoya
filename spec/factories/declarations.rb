FactoryBot.define do
  factory :declaration do
    declaration { Faker::Lorem.sentence }
    comment { Faker::Lorem.paragraphs(number: 3).join('\n\n') }
    association :user
  end
end
