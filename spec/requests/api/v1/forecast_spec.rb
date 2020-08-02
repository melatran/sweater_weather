require 'rails_helper'

describe "Forecast API" do

  it "returns the forecast for given city" do
    WebMock.allow_net_connect!
    get "/api/v1/forecast", params: {location: 'anaheim,ca'}

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)
    
  end
end
