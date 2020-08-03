require 'rails_helper'

describe Trail do
  before :each do
    json_response = File.read('./spec/fixtures/hiking_response.json')
    trails_info = JSON.parse(json_response, symbolize_names: true)
    @trails = Trail.new(location_info)
  end
end
