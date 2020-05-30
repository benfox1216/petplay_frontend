class DistanceService
  def by_location(origin, destination)
    binding.pry
    get_distance(origin, destination)
  end

  private

  def get_distance(origin, destination)
    json = parse_json(get_response(origin, destination))
    binding.pry
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_response(origin, destination)
    conn.get do |req|
      req.params['units'] = 'imperial'
      req.params['origins'] = origin[:zip_code]
      req.params['destinations'] = destination[:zip_code]
    end
  end

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/distancematrix/json',
      params: { key: ENV['GOOGLE_API_KEY'] }
    )
  end
end
