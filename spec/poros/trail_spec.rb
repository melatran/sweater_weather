require 'rails_helper'

describe Trail do
  before :each do
    json_response = File.read('./spec/fixtures/hiking_response.json')
    trails_info = JSON.parse(json_response, symbolize_names: true)
    @trails = Trail.new(trails_info)
  end

  it "exists" do
    expect(@trails).to be_a(Trail)
  end

  it "can return attributes about trails" do
  
  end
end
