require 'rails_helper'

RSpec.describe 'As a User' do
  it 'I should see all my info with a prompt to enter zip upon login' do
    user = create(:user, zipcode: '00000')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/profile/#{user.id}"

    expect(page).to have_content(user.name)
    expect(page).to have_content("#{user.email}")

    fill_in :zipcode, with: '80012'
    click_button 'Submit'

    expect(page).to have_content("Zipcode: 80012")
  end

  it 'I should see an error message if an invalid zip in entered' do
    user = create(:user, zipcode: '00000')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/profile/#{user.id}"

    fill_in :zipcode, with: 'adsetgf'
    click_button 'Submit'

    expect(page).to have_content('Invalid zipcode, please try again.')
    expect(current_path).to eq("/profile/#{user.id}")
  end
end
