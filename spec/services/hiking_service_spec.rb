require 'rails_helper'

describe HikingService do
  it ".get_trails" do
    WebMock.allow_net_connect!

    service = HikingService.new
    trail_info = service.get_trails(40.0274, -105.2519)

    expect(trail_info).to be_a(Hash)
    expect(trail_info[:trails]).to_not be_nil
  end
end
