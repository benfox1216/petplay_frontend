require 'rails_helper'

RSpec.describe 'Google Distance Service' do
  it 'can get distance between origin & destination' do
    service = DistanceService.new

    expect(service.class).to eql(DistanceService)
    origin = { zip_code: 80202 }
    destination = { zip_code: 80212 }
    location1 = service.by_location(origin, destination)
    expect(location1).to have_key :distance
  end
end
