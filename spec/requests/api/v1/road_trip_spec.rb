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
    JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(204)
  end
end
