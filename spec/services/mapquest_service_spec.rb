require 'rails_helper'

describe MapQuestService do
  it ".get_coordinates" do
    WebMock.allow_net_connect!

    service = MapQuestService.new
    map_info = service.get_coordinates("Anaheim, CA")

    expect(map_info[:results]).to be_an(Array)
    expect(map_info[:results][0][:locations][0][:latLng][:lat]).to eq(33.834492) #lat
    expect(map_info[:results][0][:locations][0][:latLng][:lng]).to eq(-117.915638) #long
    expect(map_info[:results][0][:locations][0][:adminArea5]).to eq("Anaheim")
    expect(map_info[:results][0][:locations][0][:adminArea3]).to eq("CA")
    expect(map_info[:results][0][:locations][0][:adminArea1]).to eq("US")
  end

  it ".get_route" do
    WebMock.allow_net_connect!
    service = MapQuestService.new
    route_info = service.get_route("Anaheim, CA", "Las Vegas, NV")

    expect(route_info).to be_a(Hash)
    expect(route_info[:route][:formattedTime]).to eq("03:59:44")
  end
end
