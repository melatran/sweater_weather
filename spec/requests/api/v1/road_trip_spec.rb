require 'rails_helper'

describe "Road Trip Endpoints" do
  it "returns the forecast for given city" do
    WebMock.allow_net_connect!
    post '/api/v1/roadtrip', params: {origin: 'anaheim,ca', destination: 'las vegas, nv', api_key: "jgn983hy48thw9begh98h4539h4"}

    expect(response).to be_successful
    expect(response.status).to eq(204)
  end
end
