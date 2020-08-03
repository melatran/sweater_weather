require 'rails_helper'

describe "Trails Endpoint" do

  it "returns a list of nearest trails" do
    get "/api/v1/trails", params: {location: 'denver,co'}

    json = JSON.parse(response.body, symbolize_names: true)

    expected_location = {
            :lat=>39.738453,
            :lon=>-104.984853,
            :city=>"Denver",
            :state=>"CO",
            :country=>"US"}
    expected_forecast = {
            :temperature=>71.87,
            :summary=>"clear sky"
    }

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(json[:data][:attributes].keys).to eq([:id, :forecast_info, :trails])
    expect(json[:data][:attributes][:forecast_info][:location]).to eq(expected_location)
    expect(json[:data][:attributes][:forecast_info][:forecast]).to_not be_nil
    expect(json[:data][:attributes][:trails]).to_not be_nil

  end
end
