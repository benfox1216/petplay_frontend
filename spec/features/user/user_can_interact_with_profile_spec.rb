require 'rails_helper'

RSpec.describe 'As a User' do
  it 'I should see all my info with a prompt to enter zip upon login' do
    user = User.create(name: "Bob", email: "bob@example",
                        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png",
                        google_token: "abc123", zipcode: "80012")

    visit "/profile/#{user.id}"

    expect(page).to have_content(user.name)
    expect(page).to have_content("Email: #{user.email}")
    expect(page).to have_content("Zipcode: #{user.zipcode}")
  end
end
