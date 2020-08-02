require 'rails_helper'

describe 'Backgrounds API' do
  it "returns a background image url" do
    WebMock.allow_net_connect!

    get "/api/v1/backgrounds", params: {location: 'anaheim,ca'}
    expect(response).to be_successful

    backgrounds = JSON.parse(response.body, symbolize_names: true)
  end
end
