require 'rails_helper'

describe "As a user" do
  it "I can add a pet" do
    user = create(:user)
    
    visit "/profile/#{user.id}"
    click_button 'Add A Pet'
    
    fill_in :type, with: 'Cat'
    fill_in :name, with: 'Franco'
    fill_in :age, with: '9'
    fill_in :breed, with: 'Tuxedo'
    fill_in :size, with: '9'
    click_on 'Submit'
    
    
  end
end