require 'rails_helper'

describe "Sinatra Backend" do
  it "returns expected response" do
    json_response = File.read('spec/fixtures/return_parks_via_sinatra.json')
    stub_request(:get, "http://localhost:3001/api/v1/parks").
        to_return(status: 200, body: json_response)
    json = JSON.parse(json_response, symbolize_names: true)

    expect(json.class).to eq(Hash)
    expect(json[:parks].count).to eq(5)

    expect(json[:parks][0]).to have_key :name
    expect(json[:parks][0][:name]).to eq("Dove Valley Regional Park")

    expect(json[:parks][0]).to have_key :lat_lng
    expect(json[:parks][0][:lat_lng]).to have_key :lat
    expect(json[:parks][0][:lat_lng]).to have_key :lng

    expect(json[:parks][0][:lat_lng][:lat]).to eq(39.575607)
    expect(json[:parks][0][:lat_lng][:lng]).to eq(-104.826008)
  end
end
