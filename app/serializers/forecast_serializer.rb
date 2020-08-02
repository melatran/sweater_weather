class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :timezone, :current_forecast, :hourly_forecast, :daily_forecast
end
