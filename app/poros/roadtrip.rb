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
      forecast: get_forecast
    }
  end

  def service
    MapQuestService.new.get_route(origin, destination)
  end

  def get_travel_distance_for_trip
    service[:route][:distance]
  end

  def get_travel_time
    service[:route][:formattedTime]
  end

  def get_forecast
    
  end
end
