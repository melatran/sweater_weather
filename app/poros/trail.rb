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

  def map_service
    MapQuestService.new
  end

  def get_directions
    from = forecast_info[:location].city
    to = @trails[0][:location]

    x = map_service.get_directions(from, to)
    x[:route][:distance]
  end
end
