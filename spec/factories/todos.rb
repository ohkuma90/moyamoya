FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.sentence }
    category_id { rand(2..Category.count) }
    memo { Faker::Lorem.paragraphs(number: 3).join('\n\n') } 
    priority_id { rand(2..Priority.count) }
    association :user
  end
end
