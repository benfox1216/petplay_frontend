require 'rails_helper'

RSpec.feature "user logs in" do
  before(:all) do
    OmniAuth.config.test_mode = true
  end

  before(:each) do
    OmniAuth.config.mock_auth[:google] = nil
  end

  after(:all) do
    OmniAuth.config.test_mode = false
  end

  scenario "using google oauth2" do
    OmniAuth.config.add_mock(:google_oauth2, {
        :provider => "google",
        :info => {
            :email => "bob@example.com",
            :name => "Bob",
            :image => "https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Stick_Figure.svg/1200px-Stick_Figure.svg.png"
        },
        :credentials => {
            :token => "abcdefg12345"
        }})

    visit root_path

    expect(page).to have_button("Login With Google")

    click_button "Login With Google"

    expect(page).to have_content("Bob")
    expect(page).to have_content("Logged in with Google!")
    expect(page).to have_button("Log Out")
  end

  scenario "failing to login with google" do
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials

    visit root_path

    click_button "Login With Google"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Failed to connect to Google")
  end
end
