# frozen_string_literal: true

RSpec.describe ESI::Client::Incursion, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_incursions" do
    context "when the response is 200" do
      let(:response) { [{ "constellation_id" => 20_000_607, "faction_id" => 500_019, "has_boss" => true, "infested_solar_systems" => [30_004_148, 30_004_149, 30_004_150, 30_004_151, 30_004_152, 30_004_153, 30_004_154], "influence" => 0.9, "staging_solar_system_id" => 30_004_154, "state" => "mobilizing", "type" => "Incursion" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/incursions/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_incursions).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/incursions/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_incursions }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/incursions/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_incursions }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/incursions/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_incursions }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
