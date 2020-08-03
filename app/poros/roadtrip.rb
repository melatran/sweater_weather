class Roadtrip
  attr_reader :origin, :destination

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def format_roadtrip
    {
      origin: @origin,
      destination: @destination,
      travel_time: get_travel_time,
      travel_distance: get_travel_distance_for_trip,
      forecast: format_forecast
    }
  end

  def service
    MapQuestService.new
  end

  def get_travel_distance_for_trip
    trip = service.get_route(origin, destination)
    trip[:route][:distance]
  end

  def get_travel_time
    trip = service.get_route(origin, destination)
    trip[:route][:formattedTime]
  end

  def get_forecast
    destination_info = service.get_coordinates(destination)
    coordinate = Location.new(destination_info)
    lat = coordinate.lat
    lon = coordinate.lon
    weather_data = OpenWeatherService.new.get_forecast_data(lat, lon)
    city_forecast = Forecast.new(coordinate, weather_data).current_forecast
  end

  def format_forecast
    {
      temperature: get_forecast[:temp],
      description: get_forecast[:weather][0][:description]
    }
  end
end
