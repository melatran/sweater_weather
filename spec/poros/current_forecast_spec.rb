require 'rails_helper'

describe CurrentForecast do
  before :each do
    json_response = File.read('./spec/fixtures/weather_response.json')
    weather_data = JSON.parse(json_response, symbolize_names: true)
    @current_forecast = CurrentForecast.new(weather_data, 'America/Los_Angeles')
  end

  it "initializes with attributes" do
    expect(@current_forecast.sunset).to eq(1596336718)
    expect(@current_forecast.sunrise).to eq(1596287030)
    expect(@current_forecast.temp).to eq(72.37)
    expect(@current_forecast.feels_like).to eq(71.69)
    expect(@current_forecast.humidity).to eq(57)
    expect(@current_forecast.uvi).to eq(10.78)
    expect(@current_forecast.summary).to eq("clear sky")
  end
end
