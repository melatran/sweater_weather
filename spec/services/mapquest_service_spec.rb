require 'rails_helper'

describe MapquestService do
  it ".get_coordinates" do
    #get lat and long for city
    service = MapquestService.new
    results = service.get_coordinates("Anaheim, CA") #coordinates for disneyland

    expect(results).to eq("33.812511") #lat
    expect(results).to eq("-117.918976") #long
  end
end


#Needs to pull out the city and state from the GET request and send it to MapQuest’s Geocoding API to retrieve the lat and long for the city (this can be its own story). Use of the MapQuest’s Geocoding API is a hard requirement.
