require 'rails_helper'

describe "Forecast Endpoint" do
  WebMock.allow_net_connect!
  it "returns the forecast for given city" do
    get "/api/v1/forecast", params: {location: 'anaheim,ca'}

    forecast = JSON.parse(response.body, symbolize_names: true)
    expected_keys = [:id,
              :location,
              :timezone,
              :current_forecast,
              :hourly_forecast,
              :daily_forecast]

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(forecast[:data][:attributes].keys).to eq(expected_keys)
    expect(forecast).to be_a(Hash)
    expect(forecast[:data][:attributes][:hourly_forecast].length).to eq(48)
    expect(forecast[:data][:attributes][:daily_forecast].length).to eq(8)
  end

  it "returns an error message if location is empty" do
    get "/api/v1/forecast", params: {location: ''}

    error = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(412)
    expect(error[:error]).to eq("Location cannot be blank")
  end
end
