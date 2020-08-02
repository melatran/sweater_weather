require 'rails_helper'

describe Location do
  before :each do
    json_response = File.read('./spec/fixtures/mapquest_response.json')
    location_info = JSON.parse(json_response, symbolize_names: true)
    @location = Location.new(location_info)
  end

  it "exists" do
    expect(@location).to be_a(Location)
  end

  it "can get attributes for location" do
    expect(@location.city).to eq("Anaheim")
    expect(@location.country).to eq("US")
    expect(@location.state).to eq("CA")
    expect(@location.lat).to eq(33.834492)
    expect(@location.lon).to eq(-117.915638)
  end
end
