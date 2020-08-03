class Roadtrip
  attr_reader :origin, :destination, :travel_time, :temperature, :temp_summary

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def get_travel_distance(data)
    data[:route][:distance]
  end

  def get_travel_time(data)
    data[:route][:formattedTime]
  end
end
