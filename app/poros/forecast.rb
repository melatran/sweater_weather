class Forecast
  attr_reader :data,
              :location,
              :current_forecast,
              :hourly_forecast,
              :daily_forecast,
              :id,
              :timezone

  def initialize(location, data)
    @location = location
    @timezone = data[:timezone]
    @current_forecast = get_current_forecast(data)
    @hourly_forecast = get_hourly_forecast(data)
    @daily_forecast = get_daily_forecast(data)
    @id = nil
  end

  def get_current_forecast(data)
    data[:current].without(:pressure, :clouds, :wind_speed, :wind_deg, :dew_point)
  end

  def get_hourly_forecast(data)
    data[:hourly].map do |data_info|
      data_info.slice(:dt, :temp, :weather)
    end
  end


  def get_daily_forecast(data)
    data[:daily].map do |data_info|
      data_info.slice(:dt, :weather, :rain, :temp)
      data_info[:temp].slice!(:min, :max)
      data_info
    end
  end

  def format_for_trails
    {
      location: location,
      forecast: {
        temperature: current_forecast[:temp],
        summary: current_forecast[:weather][0][:description]
      }
    }
  end

  # def convert_to_miles(meters)
  #   # 1 mile = 1609.34 meters
  #   meters / 1609.34
  # end
end
