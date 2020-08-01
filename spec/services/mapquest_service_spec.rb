require 'rails_helper'

describe MapQuestService do
  it ".get_coordinates" do
    #get lat and long for city
    service = MapQuestService.new
    map_info = service.get_coordinates("Anaheim, CA") #coordinates for disneyland

    expect(map_info[:results]).to be_an(Array)
    expect(map_info[:results][0][:locations][0][:latLng][:lat]).to eq(33.834492) #lat
    expect(map_info[:results][0][:locations][0][:latLng][:lng]).to eq(-117.915638) #long
  end
end


#Needs to pull out the city and state from the GET request and send it to MapQuest’s Geocoding API to retrieve the lat and long for the city (this can be its own story). Use of the MapQuest’s Geocoding API is a hard requirement.

#results[:results][0][:locations][0][:latLng][:lng]]
#results[:results][0][:locations][0][:latLng][:lng]
