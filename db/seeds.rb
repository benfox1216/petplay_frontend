User.destroy_all
Pet.destroy_all
Petplay.destroy_all

#users
user_1 = User.create!(name: 'Megan Stakely', email: 'megan@megan.com', image: 'https://en.bcdn.biz/Images/2018/6/12/49c138bc-9393-4dfe-919e-beeb1aaa01ae.jpg')
user_2 = User.create!(name: 'Rob Archovich', email: 'rob@rob.com', image: 'https://en.bcdn.biz/Images/2018/6/12/49c138bc-9393-4dfe-919e-beeb1aaa01ae.jpg')

#pets
user_1.pets.create!(name: 'Jack', species: 'Dog', breed: 'Terrier', size: 'small', age: 7, about_me: 'I am a good boy')
user_1.pets.create!(name: 'Franco', species: 'Cat', breed: 'Tuxedo', size: 'medium', age: 6, about_me: 'Cool cat')
user_1.pets.create!(name: 'Sweety', species: 'Dog', breed: 'German Shepherd', size: 'large', age: 5, about_me: 'I am a good girl')

user_2.pets.create!(name: 'Princess', species: 'Cat', breed: 'Long haired', size: 'medium', age: 3, about_me: "I'm hungry")
user_2.pets.create!(name: 'Durst', species: 'Dog', breed: 'Mixed', size: 'medium', age: 5, about_me: 'Can I go outside?')
user_2.pets.create!(name: 'Little Devil', species: 'Cat', breed: 'Mixed', size: 'large', age: 7, about_me: 'Where am I?')

#petplays
user_1.petplays.create!(title: 'Big Dogs + Cats', location: 'Utah Park, 1800 S Peoria St, Aurora, CO 80202, USA', pet_players: "#{user_1.image}", date: "10/02/2020", time: "10:00 AM")
user_1.petplays.create!(title: 'Any and All', location: 'Utah Park, 1800 S Peoria St, Aurora, CO 80202, USA', pet_players: "#{user_1.image}", date: "10/02/2020", time: "10:00 AM")
user_2.petplays.create!(title: 'Cats Only!', location: 'Utah Park, 1800 S Peoria St, Aurora, CO 80202, USA', pet_players: "#{user_1.image}, #{user_2.image}", date: "10/02/2020", time: "10:00 AM")
