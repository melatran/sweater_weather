class Location
  attr_reader :lat, :lon, :city, :state, :country

  def initialize(data)
    @lat = get_lat(data)
    @lon = get_lon(data)
    @city = get_city(data)
    @state = get_state(data)
    @country = get_country(data)
  end

  def get_lat(data)
    data[:results][0][:locations][0][:latLng][:lat]
  end

  def get_lon(data)
    data[:results][0][:locations][0][:latLng][:lng]
  end

  def get_city(data)
    data[:results][0][:locations][0][:adminArea5]
  end

  def get_state(data)
    data[:results][0][:locations][0][:adminArea3]
  end

  def get_country(data)
    data[:results][0][:locations][0][:adminArea1]
  end

end
