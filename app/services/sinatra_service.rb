class SinatraService
  def sinatra_json(uri)
    parse(uri)
  end
  
  private

  def parse(uri)
    JSON.parse(response(uri).body, symbolize_names: true)
  end
  
  def response(uri)
    url = ENV['PETPLAY_DOMAIN']
    Faraday.get("#{url}/#{uri}")
  end
end
