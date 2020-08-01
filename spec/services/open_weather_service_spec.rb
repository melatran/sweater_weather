require 'rails_helper'

describe OpenWeatherService do
  it ".get_forecast_data" do
    WebMock.allow_net_connect!
    
    service = OpenWeatherService.new
    results = service.get_forecast_data(33.834492, -117.915638)

    #information I need from current
    expect(results[:current][:temp]).to_not be_nil
    expect(results[:current][:weather][0][:description]).to_not be_nil
    expect(results[:current][:sunset]).to_not be_nil
    expect(results[:current][:sunrise]).to_not be_nil
    expect(results[:current][:feels_like]).to_not be_nil
    expect(results[:current][:humidity]).to_not be_nil
    expect(results[:current][:visibility]).to_not be_nil
    expect(results[:current][:uvi]).to_not be_nil

    expect(results[:hourly]).to_not be_empty
    expect(results[:daily]).to_not be_empty

    #8 results displayed in wireframe
    expect(results[:daily]).to be_an(Array)
    expect(results[:daily].length).to eq(8)
  end
end
