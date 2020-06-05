require 'rails_helper'

describe "As a user" do
  it "I can add a pet" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/profile/#{user.id}"
    click_link "Add A Pet"

    fill_in 'Name', with: 'Iceman'
    fill_in 'Species', with: 'Dog'
    fill_in 'Age', with: 9
    fill_in 'Breed', with: 'Siberian Husky'
    select 'Medium', from: 'Size'
    fill_in 'About me', with: 'I love treats!'
    click_on 'Create Pet'

    expect(current_path).to eq("/profile/#{user.id}")

    pet = Pet.last

    within ".pet-#{pet.id}" do
      expect(page).to have_content('Name: Iceman')
      expect(page).to have_content('Species: Dog')
      expect(page).to have_content('Age: 9')
      expect(page).to have_content('Breed: Siberian Husky')
      expect(page).to have_content('Size: Medium')
    end
  end

  it "my profile page will display two pets" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    pet_1 = create(:pet, user_id: user.id)
    pet_2 = create(:pet, user_id: user.id)

    visit "/profile/#{user.id}"

    within ".pet-#{pet_1.id}" do
      expect(page).to have_content("Name: #{pet_1.name}")
      expect(page).to have_content("Species: #{pet_1.species}")
      expect(page).to have_content("Age: #{pet_1.age}")
      expect(page).to have_content("Breed: #{pet_1.breed}")
      expect(page).to have_content("Size: #{pet_1.size}")
    end

    within ".pet-#{pet_2.id}" do
      expect(page).to have_content("Name: #{pet_2.name}")
      expect(page).to have_content("Species: #{pet_2.species}")
      expect(page).to have_content("Age: #{pet_2.age}")
      expect(page).to have_content("Breed: #{pet_2.breed}")
      expect(page).to have_content("Size: #{pet_2.size}")
    end
  end

  it "I will get a flash message if a pet is not created" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/profile/#{user.id}"
    click_link "Add A Pet"

    fill_in 'Name', with: 'Iceman'
    fill_in 'Species', with: 'Dog'
    fill_in 'Breed', with: 'Siberian Husky'
    select 'Medium', from: 'Size'
    click_on 'Create Pet'

    expect(current_path).to eq("/pets/new")
    expect(page).to have_content("Pet not added. Missing fields or incorrect entry. Please try again.")
  end
end
