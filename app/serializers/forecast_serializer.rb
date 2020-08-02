class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :timezone, :current_forecast, :hourly_forecast, :daily_forecast
end
