class OpenWeatherService
  def get_forecast_data(lat, lon)
    response = conn.get('/data/2.5/onecall') do |req|
      req.params['lat'] = lat
      req.params['lon'] = lon
      req.params['exclude'] = 'minutely'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://api.openweathermap.org') do |req|
      req.params['appid'] = ENV["WEATHER_KEY"]
      req.params['units'] = 'imperial'
    end
  end
end
