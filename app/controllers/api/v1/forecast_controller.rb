class Api::V1::ForecastController < ApplicationController
  def index
    location = MapQuestService.new.get_coordinates(params[:location])
    location_info = Location.new(location)
    lat = location_info.lat
    lon = location_info.lon
    weather_data = OpenWeatherService.new.get_forecast_data(lat, lon)
    city_forecast = Forecast.new(location_info, weather_data)

    render json: ForecastSerializer.new(city_forecast)
  end
end
