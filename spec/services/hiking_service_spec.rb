require 'rails_helper'

describe HikingService do
  it ".get_trails" do
    WebMock.allow_net_connect!

    service = MapQuestService.new
    trail_info = service.get_coordinates(40.0274, -105.2519)
  end
end
