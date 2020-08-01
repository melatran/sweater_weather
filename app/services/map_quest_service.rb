class MapQuestService
  def get_coordinates(city)
    response = conn.get("/geocoding/v1/address") do |req|
      req.params["location"] = city
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

# http://www.mapquestapi.com/geocoding/v1/address?key=KxCAVYEDwuTN0d8wcgw441pofOTOKbsV&location=Anaheim, CA
