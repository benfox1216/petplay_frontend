FactoryBot.define do
  factory :petplay do
    association :user

    title { Faker::Book.title }
    pet_players { 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ba-bamail.com%2Fcontent.aspx%3Femailid%3D22163&psig=AOvVaw0U1kVPt5PeukVQqP3H3IWF&ust=1591379683222000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDGnMLd6OkCFQAAAAAdAAAAABAD' }
    location { "Burberry Park" }
    date { "10/02/2020" }
    time { "10:00 AM" }
  end
end
