class DistanceService
  def by_location(origin, destination)
    binding.pry
    get_distance(origin, destination)
  end

  private

  def get_distance(origin, destination)
    json = parse_json(get_response(origin, destination))
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_response(origin, destination)
    conn.get do |req|
      # params
    end
  end

  def conn
    Faraday.new(
      # url:
      # params:
    )
  end
end
