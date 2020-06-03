User.destroy_all
Pet.destroy_all
PetPlay.destroy_all

#users
user_1 = User.create!(name: 'Megan Stakely', email: 'megan@megan.com', image: 'nothing', zipcode: '80215')
user_2 = User.create!(name: 'Rob Archovich', email: 'rob@rob.com', image: 'nothing')

#pets
user_1.pets.create!(name: 'Jack', species: 'Dog', breed: 'Terrier', size: 'small', age: 7, about_me: 'I am a good boy')
user_1.pets.create!(name: 'Franco', species: 'Cat', breed: 'Tuxedo', size: 'medium', age: 6, about_me: 'Cool cat')
user_1.pets.create!(name: 'Sweety', species: 'Dog', breed: 'German Shepherd', size: 'large', age: 5, about_me: 'I am a good girl')

user_2.pets.create!(name: 'Princess', species: 'Cat', breed: 'Long haired', size: 'medium', age: 3, about_me: "I'm hungry")
user_2.pets.create!(name: 'Durst', species: 'Dog', breed: 'Mixed', size: 'medium', age: 5, about_me: 'Can I go outside?')
user_2.pets.create!(name: 'Little Devil', species: 'Cat', breed: 'Mixed', size: 'large', age: 7, about_me: 'Where am I?')

#pet_plays
user_1.pet_plays.create!(title: 'Big Dogs + Cats', location: '80215', pet_players: "#{user_1.id}")
user_1.pet_plays.create!(title: 'Any and All', location: '80516', pet_players: "#{user_1.id}")

user_2.pet_plays.create!(title: 'Cats Only!', location: '80215', pet_players: "#{user_1.id}, #{user_2.id}")