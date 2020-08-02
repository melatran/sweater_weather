class Roadtrip
  attr_reader :travel_time, :distance

  def initialize(data)
    @travel_time = get_travel_time(data)
    @distance = get_travel_distance(data)
  end

  def get_travel_distance(data)
    data[:route][:distance]
  end

  def get_travel_time(data)
    data[:route][:formattedTime]
  end
end
