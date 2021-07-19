# frozen_string_literal: true

RSpec.describe ESI::Client::Route do
  subject(:client) { ESI::Client.new(user_agent: "ESI SDK Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk)") }

  describe "#get_route_origin_destination" do
    context "when the response is 200" do
      let(:response) { [30_002_771, 30_002_770, 30_002_769, 30_002_772] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/route/1234567890/1234567890/?avoid=1234567890&connections=1234567890&flag=1234567890").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_route_origin_destination(destination: "1234567890", origin: "1234567890", avoid: "1234567890", connections: "1234567890", flag: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/route/1234567890/1234567890/?avoid=1234567890&connections=1234567890&flag=1234567890").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_route_origin_destination(destination: "1234567890", origin: "1234567890", avoid: "1234567890", connections: "1234567890", flag: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/route/1234567890/1234567890/?avoid=1234567890&connections=1234567890&flag=1234567890").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_route_origin_destination(destination: "1234567890", origin: "1234567890", avoid: "1234567890", connections: "1234567890", flag: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/route/1234567890/1234567890/?avoid=1234567890&connections=1234567890&flag=1234567890").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_route_origin_destination(destination: "1234567890", origin: "1234567890", avoid: "1234567890", connections: "1234567890", flag: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/route/1234567890/1234567890/?avoid=1234567890&connections=1234567890&flag=1234567890").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_route_origin_destination(destination: "1234567890", origin: "1234567890", avoid: "1234567890", connections: "1234567890", flag: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/route/1234567890/1234567890/?avoid=1234567890&connections=1234567890&flag=1234567890").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_route_origin_destination(destination: "1234567890", origin: "1234567890", avoid: "1234567890", connections: "1234567890", flag: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/route/1234567890/1234567890/?avoid=1234567890&connections=1234567890&flag=1234567890").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_route_origin_destination(destination: "1234567890", origin: "1234567890", avoid: "1234567890", connections: "1234567890", flag: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end
end
