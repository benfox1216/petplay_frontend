require 'rails_helper'

describe "As a user" do
  it "I can update a pet's info" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    pet = create(:pet, user_id: user.id)

    visit "/profile/#{user.id}"

    within ".pet-#{pet.id}" do
      expect(page).to have_content("Name: #{pet.name}")
      expect(page).to have_content("Species: #{pet.species}")
      expect(page).to have_content("Age: #{pet.age}")
      expect(page).to have_content("Breed: #{pet.breed}")
      expect(page).to have_content("Size: #{pet.size}")
      click_link 'Update'
    end
    
    fill_in 'Name', with: 'Iceman'
    fill_in 'Species', with: 'Dog'
    fill_in 'Age', with: 9
    fill_in 'Breed', with: 'Siberian Husky'
    select 'Medium', from: 'Size'
    fill_in 'About me', with: 'I love treats!'
    click_on 'Update Pet'
    
    expect(current_path).to eq("/profile/#{user.id}")
    
    within ".pet-#{pet.id}" do
      expect(page).to have_content("Name: Iceman")
      expect(page).to have_content("Species: Dog")
      expect(page).to have_content("Age: 9")
      expect(page).to have_content("Breed: Siberian Husky")
      expect(page).to have_content("Size: Medium")
      expect(page).to have_content("About me: I love treats!")
    end
  end
end
