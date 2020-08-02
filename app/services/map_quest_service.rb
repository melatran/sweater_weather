class MapQuestService
  def get_coordinates(location)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params["location"] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("http://www.mapquestapi.com") do |req|
      req.params["key"] = ENV["MAPQUEST_KEY"]
    end
  end
end
