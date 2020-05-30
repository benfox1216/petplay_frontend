require 'rails_helper'

RSpec.describe 'Google Distance Service' do
  service = DistanceService.new

    expect(service.class).to eql(DistanceService)

    location1 = service.by_location(origin, destination)

    expect(location1).to have_key :distance
end
