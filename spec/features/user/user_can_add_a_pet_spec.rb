require 'rails_helper'

describe "As a user" do
  it "I can add a pet" do
    user = create(:user)
    
    visit "/profile/#{user.id}"
    click_button 'Add A Pet'
    
    fill_in 'Name', with: 'Franco'
    fill_in 'Species', with: 'Cat'
    fill_in 'Age', with: '9'
    fill_in 'Breed', with: 'Tuxedo'
    fill_in 'Size', with: '9'
    click_on 'Add Pet'
  end
end