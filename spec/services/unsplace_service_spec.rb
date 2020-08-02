require 'rails_helper'

describe UnsplaceService do
  it ".get_photos" do
    WebMock.allow_net_connect!

    service = UnsplaceService.new
    photo_info = service.get_background_url("anaheim")

    expect(photo_info).to be_an(Array)
  end
end
