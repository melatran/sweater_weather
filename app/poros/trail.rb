class Trail
  attr_reader :trails, :forecast_info, :id

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
end
