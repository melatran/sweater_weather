require 'rails_helper'

describe Forecast do
  before :each do
    json_response = File.read('./spec/fixtures/weather_response.json')
    weather_json = JSON.parse(json_response, symbolize_names: true)
    @forecast_data = Forecast.new(weather_json)
  end

  it "exists" do
    expect(@forecast_data).to be_a(Forecast)
  end

  it "can get the information for the current_forecast" do
    expect(@forecast_data.current_forecast).to be_a(Hash)
    expect(@forecast_data.current_forecast[:temp]).to eq(76.84)
    expect(@forecast_data.current_forecast[:sunset]).to eq(1596336718)
    expect(@forecast_data.current_forecast[:sunrise]).to eq(1596287030)
    expect(@forecast_data.current_forecast[:temp]).to eq(76.84)
    expect(@forecast_data.current_forecast[:feels_like]).to eq(73)
    expect(@forecast_data.current_forecast[:humidity]).to eq(39)
    expect(@forecast_data.current_forecast[:visibility]).to eq(10000)
    expect(@forecast_data.current_forecast[:uvi]).to eq(10.78)
    expect(@forecast_data.current_forecast[:weather][0][:description]).to eq("clear sky")
  end

  it ".get_hourly_forecast" do
    expect(@forecast_data.hourly_forecast).to be_an(Array)
    expect(@forecast_data.hourly_forecast.length).to eq(48)
  end

  it ".get_daily_forecast" do
    expect(@forecast_data.daily_forecast).to be_an(Array)
    expect(@forecast_data.daily_forecast.length).to eq(8)
  end
end
