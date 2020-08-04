class Api::V1::ForecastController < ApplicationController
  def index
    if params[:location].empty?
      render json: {status: 412, error: 'Location cannot be blank'}, status: 412
    else
      render json: ForecastSerializer.new(get_current_forecast)
    end
  end

  private

  def get_current_forecast
    location = MapQuestService.new.get_coordinates(params[:location])
    location_info = Location.new(location)
    lat = location_info.lat
    lon = location_info.lon
    weather_data = OpenWeatherService.new.get_forecast_data(lat, lon)
    Forecast.new(location_info, weather_data)
  end
end
