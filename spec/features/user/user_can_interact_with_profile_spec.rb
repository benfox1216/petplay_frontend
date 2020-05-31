require 'rails_helper'

RSpec.describe 'As a User' do
  it 'I should see all my info with a prompt to enter zip upon login' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/profile/#{user.id}"

    expect(page).to have_content(user.name)
    expect(page).to have_content("Email: #{user.email}")
    expect(page).to have_content("Zipcode: #{user.zipcode}")
  end
end
