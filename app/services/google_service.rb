class GoogleService

  def get_json(latlng)
    response = Faraday.get("https://maps.googleapis.com/maps/api/geocode/json?latlng=#{latlng}&key=#{ENV['GOOGLE_API_KEY']}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0][:formatted_address]
  end
end


