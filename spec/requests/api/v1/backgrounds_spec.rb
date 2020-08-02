require 'rails_helper'

describe 'Backgrounds Endpoint' do
  it "returns a background image url" do
    WebMock.allow_net_connect!

    get "/api/v1/backgrounds", params: {location: 'anaheim,ca'}

    backgrounds = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(backgrounds[:data][:attributes].keys).to eq([:id, :url])
    expect(backgrounds[:data][:attributes][:url]).to eq("https://images.unsplash.com/photo-1584756033388-2db9e621e40d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE1MzczN30")
  end
end
