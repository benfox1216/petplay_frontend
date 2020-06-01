require 'rails_helper'

describe "As a user" do
  describe "when I visit the PetPlay show page" do
    it "I can see all the info for that PetPlay" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      pet_play = create(:pet_play, user_id: user.id)

      visit "/petplays/#{pet_play.id}"

      expect(page).to have_content('PetPlay: Big Dogs Meetup')
      expect(page).to have_content("Created By: #{user.name}")
      expect(page).to have_content('Location: Burberry Park')
      expect(page).to have_content('Attending: List of users attending')
    end
  end
end
