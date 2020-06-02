require 'rails_helper'

RSpec.describe 'Google Distance Service' do
  it 'can get distance between origin & destination by zip code' do

    json_response = File.read('spec/fixtures/distance_info_by_zip.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/distancematrix/json").
        to_return(status: 200, body: json_response)
    json = JSON.parse(json_response, symbolize_names: true)

    expect(json.class).to eql(Hash)
    expect(json.count).to eql(4)

    expect(json).to have_key :origin
    expect(json[:origin]).to eql("Denver, CO 80202, USA")

    expect(json).to have_key :destination
    expect(json[:destination]).to eql("Denver, CO 80212, USA")

    expect(json).to have_key :distance
    expect(json[:distance][:text]).to eql("10.4 km")

    expect(json).to have_key :duration
    expect(json[:duration][:text]).to eql("12 mins")
  end

  it 'can get distance between origin & destination by gps coordinates' do
    json_response = File.read('spec/fixtures/distance_info_by_coords.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/distancematrix/json").
        to_return(status: 200, body: json_response)
    json = JSON.parse(json_response, symbolize_names: true)

    expect(json.class).to eql(Hash)
    expect(json.count).to eql(4)

    expect(json).to have_key :origin
    expect(json[:origin]).to eql("1756 Blake St, Denver, CO 80202, USA")

    expect(json).to have_key :destination
    expect(json[:destination]).to eql("3833 Vrain St, Denver, CO 80212, USA")

    expect(json).to have_key :distance
    expect(json[:distance][:text]).to eql("5.8 km")

    expect(json).to have_key :duration
    expect(json[:duration][:text]).to eql("11 mins")
  end
end
