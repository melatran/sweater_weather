require 'rails_helper'

describe Forecast do
  before :each do
    json_response = File.read('./spec/fixtures/weather_response.json')
    weather_json = JSON.parse(json_response, symbolize_names: true)
    @forecast_data = Forecast.new(weather_json, 'America/Los_Angeles')
  end

  it "exists" do
    expect(@forecast_data).to be_a(Forecast)
    expect(@forecast_data.timezone).to eq('America/Los_Angeles')
    expect(@forecast_data.data).to be_a(Hash)
  end

  it "can get the information for the current_forecast" do
    expect(@forecast_data.sunset).to eq(1596336718)
    expect(@forecast_data.sunrise).to eq(1596287030)
    expect(@forecast_data.temp).to eq(76.84)
    expect(@forecast_data.feels_like).to eq(73)
    expect(@forecast_data.humidity).to eq(39)
    expect(@forecast_data.visibility).to eq(6.213727366498068)
    expect(@forecast_data.uvi).to eq(10.78)
    expect(@forecast_data.summary).to eq("clear sky")
  end
end
