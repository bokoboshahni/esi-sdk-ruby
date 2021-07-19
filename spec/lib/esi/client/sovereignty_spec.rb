# frozen_string_literal: true

RSpec.describe ESI::Client::Sovereignty do
  subject(:client) { ESI::Client.new(user_agent: "ESI SDK Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk)") }

  describe "#get_sovereignty_campaigns" do
    context "when the response is 200" do
      let(:response) { [{ "attackers_score" => 0.4, "campaign_id" => 32_833, "constellation_id" => 20_000_125, "defender_id" => 1_695_357_456, "defender_score" => 0.6, "event_type" => "station_defense", "solar_system_id" => 30_000_856, "start_time" => "2016-10-29T14:34:40Z", "structure_id" => 61_001_096 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/campaigns/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_sovereignty_campaigns).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/campaigns/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_sovereignty_campaigns }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/campaigns/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_sovereignty_campaigns }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/campaigns/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_sovereignty_campaigns }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/campaigns/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_sovereignty_campaigns }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/campaigns/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_sovereignty_campaigns }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_sovereignty_map" do
    context "when the response is 200" do
      let(:response) { [{ "faction_id" => 500_001, "system_id" => 30_045_334 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/map/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_sovereignty_map).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/map/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_sovereignty_map }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/map/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_sovereignty_map }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/map/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_sovereignty_map }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/map/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_sovereignty_map }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/map/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_sovereignty_map }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_sovereignty_structures" do
    context "when the response is 200" do
      let(:response) { [{ "alliance_id" => 498_125_261, "solar_system_id" => 30_000_570, "structure_id" => 1_018_253_388_776, "structure_type_id" => 32_226, "vulnerability_occupancy_level" => 2, "vulnerable_end_time" => "2016-10-29T05:30:00Z", "vulnerable_start_time" => "2016-10-28T20:30:00Z" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/structures/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_sovereignty_structures).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/structures/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_sovereignty_structures }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/structures/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_sovereignty_structures }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/structures/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_sovereignty_structures }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/structures/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_sovereignty_structures }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/sovereignty/structures/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_sovereignty_structures }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end
end
