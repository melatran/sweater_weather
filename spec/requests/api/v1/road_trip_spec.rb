require 'rails_helper'

describe "Road Trip Endpoints" do
  it "returns the forecast for given city" do
    user_params = {
      'email': 'email@gmail.com',
      'password': 'password',
      'password_confirmation': 'password'
    }

    post '/api/v1/users', params: user_params
    json = JSON.parse(response.body, symbolize_names: true)

    api_key =  json[:data][:attributes][:api_key]

    roadtrip_params = {
          'origin': 'anaheim, ca',
          'destination': 'las vegas, nv',
          'api_key': api_key
    }

    post '/api/v1/roadtrip', params: roadtrip_params
    json2 = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(json2[:roadtrip].keys).to eq([
                  :origin,
                  :destination,
                  :travel_time,
                  :travel_distance,
                  :forecast
                ])
    expect(json2[:roadtrip][:origin]).to eq("anaheim, ca")
    expect(json2[:roadtrip][:destination]).to eq("las vegas, nv")
  end

  it "returns an error if user api key incorrect" do
    roadtrip_params = {
          'origin': 'anaheim, ca',
          'destination': 'las vegas, nv',
          'api_key': "1234"
    }

    post '/api/v1/roadtrip', params: roadtrip_params
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:status]).to eq(400)
    expect(json[:api_key]).to eq("Invalid credentials")
  end
end
