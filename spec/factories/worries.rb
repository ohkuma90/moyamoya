FactoryBot.define do
  factory :worry do
    text { Faker::Lorem.paragraphs(number: 3).join('\n\n') } 
    category_id { rand(2..Category.count) }
    title { Faker::Lorem.sentence }
    association :user
  end
end
