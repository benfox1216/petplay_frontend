require 'rails_helper'

RSpec.describe 'As a user' do
  it 'can see nearby PetPlays when I visit /petplays' do
    user = create(:user, zipcode: '80202')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    petplayer1A = create(:user, zipcode: '80012')
    petplayer1B = create(:user, zipcode: '80012')
    petplayer1C = create(:user, zipcode: '80012')

    petplay1 = create(:petplay,
                      title: 'PetPlay Test 1',
                      pet_players: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ba-bamail.com%2Fcontent.aspx%3Femailid%3D22163&psig=AOvVaw0U1kVPt5PeukVQqP3H3IWF&ust=1591379683222000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDGnMLd6OkCFQAAAAAdAAAAABAD",
                      location: '80202',
                      date: "10/02/2020",
                      time: "10:00 AM",
                      user_id: petplayer1A.id)

    petplayer2A = create(:user, zipcode: '80202')
    petplayer2B = create(:user, zipcode: '80202')
    petplayer2C = create(:user, zipcode: '80202')

    petplay2 = create(:petplay,
                      title: 'PetPlay Test 2',
                      pet_players: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ba-bamail.com%2Fcontent.aspx%3Femailid%3D22163&psig=AOvVaw0U1kVPt5PeukVQqP3H3IWF&ust=1591379683222000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDGnMLd6OkCFQAAAAAdAAAAABAD",
                      location: '80202',
                      date: "10/02/2020",
                      time: "10:00 AM",
                      user_id: petplayer2A.id)

    petplayer3A = create(:user, zipcode: '80012')
    petplayer3B = create(:user, zipcode: '80012')
    petplayer3C = create(:user, zipcode: '80012')

    petplay3 = create(:petplay,
                      title: 'PetPlay Test 3',
                      pet_players: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.ba-bamail.com%2Fcontent.aspx%3Femailid%3D22163&psig=AOvVaw0U1kVPt5PeukVQqP3H3IWF&ust=1591379683222000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKDGnMLd6OkCFQAAAAAdAAAAABAD",
                      location: '80202',
                      date: "10/02/2020",
                      time: "10:00 AM",
                      user_id: petplayer3A.id)

    visit '/petplays'

    expect(current_path).to eql('/petplays')
    expect(page).to have_content('There are 3 PetPlays near 80202')
    within "#pet-play-1" do
      expect(page).to have_content("#{petplay1.title}")
    end

    within('#pet-play-2') do
      expect(page).to have_content("#{petplay2.title}")
    end

    within('#pet-play-3') do
      expect(page).to have_content("#{petplay3.title}")
    end
  end
end
