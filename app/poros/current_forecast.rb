class CurrentForecast
  attr_reader :current_time,
              :current,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :visibility,
              :uvi,
              :summary

  def initialize(data, timezone)
    @current_time = Time.now.in_time_zone(timezone)
    @current = data[:current]
    @sunrise = current[:sunrise]
    @sunset = current[:sunset]
    @temp = current[:temp]
    @feels_like = current[:feels_like]
    @humidity = current[:humidity]
    @visibility = convert_to_miles(current[:visibility])
    @uvi = current[:uvi]
    @summary = current[:weather][0][:description]
  end

  def convert_to_miles(meters)
    # 1 mile = 1609.34 meters
    meters / 1609.34
  end
end
