require 'rails_helper'

describe Roadtrip do
  before :each do
    json_response = File.read('./spec/fixtures/roadtrip_response.json')
    route = JSON.parse(json_response, symbolize_names: true)
    @roadtrip = Roadtrip.new(route)
  end

  it "exists" do
    expect(@roadtrip).to be_a(Roadtrip)
  end

  it "can get attributes for a roadtrip" do
    expect(@roadtrip.travel_time).to eq("03:59:44")
    expect(@roadtrip.distance).to eq(265.467)
  end
end
