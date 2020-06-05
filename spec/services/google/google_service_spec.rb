require 'rails_helper'

RSpec.describe "Google Reverse Geo Locator Service" do
  it 'can return an address when given a lat and lng' do

    json_response = File.read('spec/fixtures/returned_address_by_latlng.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json").
        to_return(status: 200, body: json_response)
    json = JSON.parse(json_response, symbolize_names: true)

    expect(json.class).to eq(Hash)
    expect(json.count).to eq(1)

    expected = "Erie Community Park, 450 Powers St, Erie, CO 80516, USA"
    expect(json).to have_key :park_address
    expect(json[:park_address]).to have_key :formatted_address
    expect(json[:park_address][:formatted_address]).to eq(expected)
  end
end
