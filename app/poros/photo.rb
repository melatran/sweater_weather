class Photo
  attr_reader :id,
              :url

  def initialize(photo_data)
    @id = nil
    @url = photo_data[:results][0][:urls][:raw]
  end
end
