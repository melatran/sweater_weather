require 'rails_helper'

describe MapQuestService do
  it ".get_coordinates" do
    WebMock.allow_net_connect!

    service = MapQuestService.new
    map_info = service.get_coordinates("Anaheim, CA")

    expect(map_info[:results]).to be_an(Array)
    expect(map_info[:results][0][:locations][0][:latLng][:lat]).to eq(33.834492) #lat
    expect(map_info[:results][0][:locations][0][:latLng][:lng]).to eq(-117.915638) #long
  end

  it ".get_directions" do
    service = MapQuestService.new
    directions = service.get_directions("Denver, Co", "Boulder, CO")

    expect(directions).to be_a(Hash)
    expect(directions[:route][:legs][0][:maneuvers]).to_not be_nil
  end
end
