require 'rails_helper'

describe Trail do
  before :each do
    json_response = File.read('./spec/fixtures/hiking_response.json')
    trails_info = JSON.parse(json_response, symbolize_names: true)
    @trails = Trail.new("denver,co", trails_info)
  end

  it "exists" do
    expect(@trails).to be_a(Trail)
  end

  it "can return attributes about trails" do
    expect(@trails.trail_info.length).to eq(10)
    expect(@trails.trail_info[0][:name]).to eq("Monarch Lake to Crater Lake")
    expect(@trails.trail_info[0][:summary]).to eq("Gorgeous scenery with waterfalls and wildflowers ending at a breathtaking cirque and glacier lake.")
    expect(@trails.trail_info[0][:difficulty]).to eq("blueBlack")
    expect(@trails.trail_info[0][:location]).to eq("Granby, Colorado")
  end
end
