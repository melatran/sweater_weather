class Api::V1::TrailsController < ApplicationController
  def index
    #user enters city name so MapQuestService Location will get the coordinates
    location = MapQuestService.new.get_coordinates(params[:location])
    location_info = Location.new(location)
    lat = location_info.lat
    lon = location_info.lon
    #use the coordinates to generate the current forecast
    weather_data = OpenWeatherService.new.get_forecast_data(lat, lon)
    city_forecast = Forecast.new(location_info, weather_data)
    #generate a list of trails using the lat and lon
  end
end
