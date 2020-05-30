class DistanceService
  def by_location(origin, destination)
    get_distance(origin, destination)
  end

  private

  def get_distance(origin, destination)
    formatted_distance_data(origin, destination)
  end

  def formatted_distance_data(origin, destination)
    json = parse_json(get_response(origin, destination))

    {
      origin: json[:origin_addresses].join,
      destination: json[:destination_addresses].join,
      distance: json[:rows].first[:elements].first[:distance][:text],
      duration: json[:rows].first[:elements].first[:duration][:text]
    }
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_response(origin, destination)
    conn.get do |req|
      req.params['units'] = 'imperial'
      req.params['origins'] = origin[:search_origin]
      req.params['destinations'] = destination[:search_destination]
    end
  end

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/distancematrix/json',
      params: { key: ENV['GOOGLE_API_KEY'] }
    )
  end
end
