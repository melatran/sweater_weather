require 'rails_helper'

describe Roadtrip do
  before :each do
    json_response = File.read('./spec/fixtures/roadtrip_response.json')
    route = JSON.parse(json_response, symbolize_names: true)
    @roadtrip = Roadtrip.new("Anaheim, CA", "Las Vegas, NV")
  end

  it "exists" do
    expect(@roadtrip).to be_a(Roadtrip)
  end

  it "can get attributes for a roadtrip" do
    expect(@roadtrip.origin).to eq("Anaheim, CA")
    expect(@roadtrip.destination).to eq("Las Vegas, NV")
  end

  describe "methods" do
    it ".get_travel_distance_for_trip" do
      WebMock.allow_net_connect!
      expect(@roadtrip.get_travel_distance_for_trip).to eq( 265.467)
    end

    it ".get_travel_time" do
      WebMock.allow_net_connect!
      expect(@roadtrip.get_travel_time).to eq("03:59:44")
    end

    it ".get_forecast" do
      expect(@roadtrip.get_forecast).to_not be_nil

      expected_keys = [:dt, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :visibility, :weather]

      expect(@roadtrip.get_forecast.keys).to eq(expected_keys)
    end

    it "can format the forecast" do
      expected = {:temperature=>104.05, :description=>"clear sky"}
      expect(@roadtrip.format_forecast).to eq(expected)
    end

    it "can format for roadtrip" do
      expected = {
        :origin=>"Anaheim, CA",
        :destination=>"Las Vegas, NV",
        :travel_time=>"03:59:44",
        :travel_distance=>265.467,
        :forecast=>{:temperature=>104.04, :description=>"clear sky"}
      }

      expect(@roadtrip.format_roadtrip).to_not be_nil
    end
  end
end
