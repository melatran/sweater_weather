class HikingService
  def get_trails(lat, lon)
    response = conn.get("/data/get-trails") do |req|
      req.params[:lat] = lat
      req.params[:lon] = lon
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new("https://www.hikingproject.com") do |req|
      req.params["key"] = ENV["HIKING_KEY"]
    end
  end
end
