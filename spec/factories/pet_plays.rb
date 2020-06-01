FactoryBot.define do
  factory :pet_play do
    association :user
    
    title { "Big Dogs Meetup" }
    pet_players { "List of users attending" }
    location { "Burberry Park" }
  end
end