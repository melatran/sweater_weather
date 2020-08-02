require 'rails_helper'

describe "Forecast API" do

  it "returns the forecast for given city" do
    WebMock.allow_net_connect!
    get "/api/v1/forecast", params: {location: 'anaheim,ca'}

    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)
    expected_keys = [:id,
              :timezone,
              :current_forecast,
              :hourly_forecast,
              :daily_forecast]

    expect(forecast[:data][:attributes].keys).to eq(expected_keys)
    expect(forecast).to be_a(Hash)
    expect(forecast[:data][:attributes][:current_forecast][:temp]).to eq(70.59)
    expect(forecast[:data][:attributes][:hourly_forecast].length).to eq(48)
    expect(forecast[:data][:attributes][:daily_forecast].length).to eq(8)
  end
end
