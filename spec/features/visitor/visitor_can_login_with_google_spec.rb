# require 'rails_helper'
#
# RSpec.describe 'As a visitor' do
#   describe 'I can create an account via google oauth' do
#     it 'should see a button to register with google' do
#       visit '/'
#
#       expect(page).to have_content("Welcome To PetPlay")
#       expect(page).to have_button("Login With Google")
#
#       click_button 'Login With Google'
#
#
#     end
#   end
# end

require 'rails_helper'

describe 'User', :vcr do
  before(:all) do
    OmniAuth.config.test_mode = true
  end
  before(:each) do
    OmniAuth.config.mock_auth[:google] = nil
  end
  after(:all) do
    OmniAuth.config.test_mode = false
  end
  it 'user can click a link to connect to google' do
    OmniAuth.config.add_mock(:google, {credentials: {token: "abc123"}, extra: {raw_info:{login: "b-baggins"}}})
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/'

    click_button "Login With Google"
    expect(page).to have_content("Logged in with Google!")
  end

  it 'fails to log in with google' do
    OmniAuth.config.mock_auth[:google] = :invalid_credentials

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/'

    click_button "Login With Google"

    expect(current_path).to eq('/')
    expect(page).to have_content("Failed to connect to Google")
  end

end