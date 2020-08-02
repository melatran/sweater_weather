require 'rails_helper'

describe Photo do
  before :each do
    json_response = File.read('./spec/fixtures/background_response.json')
    image_info = JSON.parse(json_response, symbolize_names: true)
    @photo = Photo.new(image_info)
  end

  it "exists" do
    expect(@photo).to be_a(Photo)
  end

  it "can get urls for the photo" do
    expect(@photo.url).to eq("https://images.unsplash.com/photo-1586313745103-0813ae6ac657?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczN30")
  end
end
