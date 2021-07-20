# frozen_string_literal: true

RSpec.describe ESI::Client::Market, type: :integration do
  subject(:client) { ESI::Client.new(user_agent: user_agent) }

  let(:user_agent) { "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)" }

  describe "#get_markets_region_orders" do
    it "automatically paginates get responses" do
      response = client.get_markets_region_orders(region_id: "10000002")
      expect(response.size).to be > 1000
    end
  end
end
