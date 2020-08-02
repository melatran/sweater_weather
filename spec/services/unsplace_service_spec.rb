require 'rails_helper'

describe UnsplashService do
  it ".get_photos" do
    WebMock.allow_net_connect!

    service = UnsplashService.new
    photo_info = service.get_background_url("los angeles")

    expect(photo_info).to be_a(Hash)
    expect(photo_info[:results]).to_not be_nil
    expect(photo_info[:results][0][:urls]).to_not be_nil
  end
end
