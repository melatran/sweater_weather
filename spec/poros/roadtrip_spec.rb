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
end
