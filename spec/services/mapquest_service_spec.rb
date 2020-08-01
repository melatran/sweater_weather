require 'rails_helper'

describe MapQuestService do
  it ".get_coordinates" do
    service = MapQuestService.new
    map_info = service.get_coordinates("Anaheim, CA")

    expect(map_info[:results]).to be_an(Array)
    expect(map_info[:results][0][:locations][0][:latLng][:lat]).to eq(33.834492) #lat
    expect(map_info[:results][0][:locations][0][:latLng][:lng]).to eq(-117.915638) #long
  end
end
