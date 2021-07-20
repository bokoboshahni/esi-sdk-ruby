# frozen_string_literal: true

RSpec.describe ESI::Client do
  subject(:client) { ESI::Client.new(user_agent: user_agent) }

  let(:user_agent) { "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)" }

  it "can be instantiated" do
    expect(client).to be_a(ESI::Client)
  end

  it "automatically paginates get responses", :vcr do
    response = client.get_markets_region_orders(region_id: "10000002")
    expect(response.size).to be > 1000
  end
end
