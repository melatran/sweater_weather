class Forecast
  attr_reader :data,
              :timezone,
              :current_time,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :visibility,
              :uvi,
              :summary

  def initialize(data, timezone)
    @data = data
    @timezone = timezone
    @current_time = Time.now.in_time_zone(@timezone)
    @sunrise = get_sunrise
    @sunset = get_sunset
    @temp = get_current_temp
    @feels_like = get_feels_like
    @humidity = get_humidity
    @visibility = get_visibility
    @uvi = get_uvi
    @summary = get_summary
  end


  def get_sunset
    @data[:current][:sunset]
  end

  def get_sunrise
    @data[:current][:sunrise]
  end

  def get_current_temp
    @data[:current][:temp]
  end

  def get_feels_like
    @data[:current][:feels_like]
  end

  def get_humidity
    @data[:current][:humidity]
  end

  def get_visibility
    convert_to_miles(@data[:current][:visibility])
  end

  def get_uvi
    @data[:current][:uvi]
  end

  def get_summary
    @data[:current][:weather][0][:description]
  end

  def get_hourly_forecast
    hash = Hash.new
    @data[:hourly][0..7].each do |data_info|
      hash["#{data_info[:dt]}"] = data_info[:temp]
      hash
    end

    return hash
  end


  def get_daily_forecast
    @data[:daily].map do |data_info|
      data_info.slice!(:dt, :weather, :rain, :temp)
      data_info[:temp].slice!(:min, :max)
      data_info
    end
  end

  def convert_to_miles(meters)
    # 1 mile = 1609.34 meters
    meters / 1609.34
  end
end
