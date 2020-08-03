require 'rails_helper'

describe Trail do
  before :each do
    json_response = File.read('./spec/fixtures/hiking_response.json')
    @trail_json = JSON.parse(json_response, symbolize_names: true)
    @trail_info = Trail.new("denver,co", trail_json)
  end

  it "exists" do
    expect(@trail_info).to be_a(Trail)
  end

  it "can return attributes about trail" do
    expect(@trail_info.trails.length).to eq(10)
    expect(@trail_info.trails[0][:name]).to eq("Monarch Lake to Crater Lake")
    expect(@trail_info.trails[0][:summary]).to eq("Gorgeous scenery with waterfalls and wildflowers ending at a breathtaking cirque and glacier lake.")
    expect(@trail_info.trails[0][:difficulty]).to eq("blueBlack")
    expect(@trail_info.trails[0][:location]).to eq("Granby, Colorado")
  end
end
