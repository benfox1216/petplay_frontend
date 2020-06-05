# require 'rails_helper'

# describe "Sinatra Backend" do
#   def conn(uri)
#     url = ENV['PETPLAY_DOMAIN'] + uri
#     Faraday.new(url)
#   end
#   ### BACKEND SERVER MUST BE RUNNING ###
#   it "returns expected response" do
#     response = conn('/api/v1/parks?location=80516').get
#     json = JSON.parse(response.body, symbolize_names: true)

#     expected = {
#       name: 'Erie Community Park',
#       lat_lng: {
#         lat: 40.0391856,
#         lng: -105.0533221
#       }
#     }

#     expect(json[:parks].count).to eq(20)
#     expect(json[:parks].first).to eq(expected)
#   end
# end
