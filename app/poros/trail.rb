class Trail
  attr_reader :trail_info, :location

  def initialize(location, data)
    @location = location
    @trail_info = get_trails_info(data)
  end

  def get_trails_info(data)
    data[:trails].map do |data_info|
      data_info.slice(:name, :summary, :difficulty, :location)
    end
  end
end
