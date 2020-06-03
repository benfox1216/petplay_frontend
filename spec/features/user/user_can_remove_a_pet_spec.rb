require 'rails_helper'

describe "As a user" do
  it "I can remove a pet" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    pet = create(:pet, user_id: user.id)

    visit "/profile/#{user.id}"
    
    within ".pet-#{pet.id}" do
      expect(page).to have_content("Name: #{pet.name}")
      click_link 'Remove'
    end
    
    expect(current_path).to eq("/profile/#{user.id}")
    expect(page).to have_no_css(".pet-#{pet.id}")
  end
end