require 'rails_helper'

describe OpenWeatherService do
  it ".get_forecast_data" do
    service = OpenWeatherService.new
    results = service.get_forecast_data(33.834492, -117.915638)
  
    expect(results[:hourly]).to be_an(Array)
    expect(results[:daily]).to be_an(Array)
    #8 results from wireframe
    expect(results[:daily].length).to eq(8)
  end
end
