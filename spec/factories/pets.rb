FactoryBot.define do
  factory :pet do
    association :user
    
    name { Faker::Creature::Dog.name }
    species { "Dog" }
    age { Faker::Number.within(range: 1..13) }
    breed { Faker::Creature::Dog.breed }
    size { Faker::Creature::Dog.size }
    about_me { "I love to chase everything!" }
  end
end