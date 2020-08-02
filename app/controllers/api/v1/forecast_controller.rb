class Api::V1::ForecastController < ApplicationController
  def index
  location = MapQuestService.new.get_coordinates(params[:location])
  lat = location[:results][0][:locations][0][:latLng][:lat]
  lon = location[:results][0][:locations][0][:latLng][:lng]
  weather_data = OpenWeatherService.new.get_forecast_data(lat, lon)
  city_forecast = Forecast.new(weather_data)
  
  render json: ForecastSerializer.new(city_forecast)
  end
end
