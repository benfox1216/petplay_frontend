require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I can create an account via google oauth' do
    it 'should see a button to register with google' do
      visit '/'

      expect(page).to have_content("Welcome To PetPlay")
      expect(page).to have_button("Register")
      expect(page).to have_button("Register With Google")
      expect(page).to have_button("Login")

      click_button 'Register With Google'


    end
  end
end