FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    image { "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ba-bamail.com%2Fcontent.aspx%3Femailid%3D22163&psig=AOvVaw0U1kVPt5PeukVQqP3H3IWF&ust=1591379683222000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDGnMLd6OkCFQAAAAAdAAAAABAD" }
    zipcode { Faker::Number.number(digits: 5) }
  end
end