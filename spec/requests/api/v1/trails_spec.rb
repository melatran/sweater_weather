require 'rails_helper'

describe "Trails Endpoint" do

  it "returns a list of nearest trails" do
    WebMock.allow_net_connect!
    get "/api/v1/trails", params: {location: 'denver,co'}

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end
