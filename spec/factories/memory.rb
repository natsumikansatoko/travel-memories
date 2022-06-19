FactoryBot.define do
  factory :memory do
    title { Faker::Lorem.characters(number:20) }
    body { Faker::Lorem.characters(number:30) }
  end
end