class Trail
  attr_reader :trails, :forecast_info, :id, :data

  def initialize(forecast_info, data)
    @forecast_info = forecast_info
    @trails = get_trails_info(data)
    @id = nil
  end

  def get_trails_info(data)
    data[:trails].map do |data_info|
      data_info.slice(:name, :summary, :difficulty, :location, :length)
    end
  end

  def format_for_trails
    trail_info = HikingService.new.get_trails(lat, lon)
    trail_data[:trails].map do |trail|
      {
        :name = trail[:name]
        :summary = trail[:summary]
        :difficulty = trail[:difficulty]
        :location = trail[:location]
        :distance = get_directions(trail[:location])
      }
    end
    trails
  end

  def map_service
    MapQuestService.new
  end

  def get_directions(endpoint)
    from = forecast_info[:location].city
    to = @trails[0][:location]

    x = map_service.get_directions(from, to)
    x[:route][:distance]
  end
end
