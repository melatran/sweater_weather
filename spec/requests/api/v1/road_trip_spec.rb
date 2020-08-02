require 'rails_helper'

describe "Road Trip Endpoints" do
  before :each do
    user_params = {
      'email': 'email@gmail.com',
      'password': 'password',
      'password_confirmation': 'password',
      'api_key': 'jgn983hy48thw9begh98h4539h4'
    }

    post '/api/v1/users', params: user_params
  end

  it "returns the forecast for given city" do
    roadtrip_params = {
          'origin': 'anaheim, ca',
          'destination': 'las vegas, nv',
          'api_key': 'jgn983hy48thw9begh98h4539h4'
    }

    post '/api/v1/roadtrip', params: roadtrip_params

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(204)
  end
end
