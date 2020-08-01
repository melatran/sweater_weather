require 'rails_helper'

describe OpenWeatherService do
  it ".get_forecast_data" do
    service = OpenWeatherService.new
    results = service.get_forecast_data(33.834492, -117.915638)

    expect(results[:current]).to_not be_empty
    expect(results[:hourly]).to_not be_empty
    expect(results[:daily]).to_not be_empty

    #8 results displayed in wireframe
    expect(results[:daily]).to be_an(Array)
    expect(results[:daily].length).to eq(8)
  end
end
