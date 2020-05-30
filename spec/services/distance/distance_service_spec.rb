require 'rails_helper'

RSpec.describe 'Google Distance Service' do
  it 'can get distance between origin & destination by zip code' do
    service = DistanceService.new

    expect(service.class).to eql(DistanceService)

    origin = { search_origin: 80202 }
    destination = { search_destination: 80212 }
    location1 = service.by_location(origin, destination)

    expect(location1.class).to eql(Hash)
    expect(location1.count).to eql(4)

    expect(location1).to have_key :origin
    expect(location1[:origin]).to eql("Denver, CO 80202, USA")

    expect(location1).to have_key :destination
    expect(location1[:destination]).to eql("Denver, CO 80212, USA")

    expect(location1).to have_key :distance
    expect(location1[:distance]).to eql("6.5 mi")

    expect(location1).to have_key :duration
    expect(location1[:duration]).to eql("12 mins")
  end

  it 'can get distance between origin & destination by gps coordinates' do
    service = DistanceService.new

    expect(service.class).to eql(DistanceService)

    origin = { search_origin: '39.752, -104.997' }
    destination = { search_destination: '39.770, -105.047' }
    location1 = service.by_location(origin, destination)

    expect(location1.class).to eql(Hash)
    expect(location1.count).to eql(4)

    expect(location1).to have_key :origin
    expect(location1[:origin]).to eql("1756 Blake St, Denver, CO 80202, USA")

    expect(location1).to have_key :destination
    expect(location1[:destination]).to eql("3833 Vrain St, Denver, CO 80212, USA")

    expect(location1).to have_key :distance
    expect(location1[:distance]).to eql("3.6 mi")

    expect(location1).to have_key :duration
    expect(location1[:duration]).to eql("11 mins")
  end
end
