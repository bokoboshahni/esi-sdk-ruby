# frozen_string_literal: true

RSpec.describe ESI::Client::Corporation do
  subject(:client) { ESI::Client.new(user_agent: "ESI SDK Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk)") }

  describe "#get_corporation" do
    context "when the response is 200" do
      let(:response) { { "alliance_id" => 434_243_723, "ceo_id" => 180_548_812, "creator_id" => 180_548_812, "date_founded" => "2004-11-28T16:42:51Z", "description" => "This is a corporation description, it's basically just a string", "member_count" => 656, "name" => "C C P", "tax_rate" => 0.256, "ticker" => "-CCP-", "url" => "http://www.eveonline.com" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_corporation(corporation_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_alliancehistory" do
    context "when the response is 200" do
      let(:response) { [{ "alliance_id" => 99_000_006, "is_deleted" => true, "record_id" => 23, "start_date" => "2016-10-25T14:46:00Z" }, { "record_id" => 1, "start_date" => "2015-07-06T20:56:00Z" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/alliancehistory/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_alliancehistory(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/alliancehistory/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_alliancehistory(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/alliancehistory/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_alliancehistory(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/alliancehistory/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_alliancehistory(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/alliancehistory/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_alliancehistory(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/alliancehistory/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_alliancehistory(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_blueprints" do
    context "when the response is 200" do
      let(:response) { [{ "item_id" => 1_000_000_010_495, "location_flag" => "CorpSAG1", "location_id" => 60_014_719, "material_efficiency" => 0, "quantity" => 1, "runs" => -1, "time_efficiency" => 0, "type_id" => 691 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/blueprints/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_blueprints(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/blueprints/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_blueprints(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/blueprints/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_blueprints(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/blueprints/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_blueprints(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/blueprints/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_blueprints(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/blueprints/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_blueprints(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/blueprints/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_blueprints(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/blueprints/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_blueprints(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_container_logs" do
    context "when the response is 200" do
      let(:response) { [{ "action" => "set_password", "character_id" => 2_112_625_428, "container_id" => 1_000_000_012_279, "container_type_id" => 17_365, "location_flag" => "CorpSAG1", "location_id" => 1_000_000_012_278, "logged_at" => "2017-10-10T14:00:00Z", "password_type" => "general" }, { "action" => "lock", "character_id" => 2_112_625_428, "container_id" => 1_000_000_012_279, "container_type_id" => 17_365, "location_flag" => "CorpSAG1", "location_id" => 1_000_000_012_278, "logged_at" => "2017-10-11T12:04:33Z", "quantity" => 30, "type_id" => 1230 }, { "action" => "configure", "character_id" => 2_112_625_428, "container_id" => 1_000_000_012_279, "container_type_id" => 17_365, "location_flag" => "CorpSAG2", "location_id" => 1_000_000_012_278, "logged_at" => "2017-10-11T12:06:29Z", "new_config_bitmask" => 31, "old_config_bitmask" => 23 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/containers/logs/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_container_logs(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/containers/logs/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_container_logs(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/containers/logs/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_container_logs(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/containers/logs/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_container_logs(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/containers/logs/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_container_logs(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/containers/logs/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_container_logs(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/containers/logs/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_container_logs(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/containers/logs/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_container_logs(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_divisions" do
    context "when the response is 200" do
      let(:response) { { "hangar" => [{ "division" => 1, "name" => "Awesome Hangar 1" }], "wallet" => [{ "division" => 1, "name" => "Rich Wallet 1" }] } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/divisions/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_divisions(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/divisions/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_divisions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/divisions/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_divisions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/divisions/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_divisions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/divisions/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_divisions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/divisions/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_divisions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/divisions/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_divisions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/divisions/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_divisions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_facilities" do
    context "when the response is 200" do
      let(:response) { [{ "facility_id" => 123, "system_id" => 45_678, "type_id" => 2502 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/facilities/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_facilities(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/facilities/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_facilities(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/facilities/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_facilities(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/facilities/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_facilities(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/facilities/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_facilities(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/facilities/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_facilities(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/facilities/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_facilities(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/facilities/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_facilities(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_icons" do
    context "when the response is 200" do
      let(:response) { { "px128x128" => "https://images.evetech.net/corporations/1000010/logo?tenant=tranquility&size=128", "px256x256" => "https://images.evetech.net/corporations/1000010/logo?tenant=tranquility&size=256", "px64x64" => "https://images.evetech.net/corporations/1000010/logo?tenant=tranquility&size=64" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/icons/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_icons(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/icons/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_icons(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "No image server for this datasource" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/icons/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_corporation_icons(corporation_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/icons/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_icons(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/icons/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_icons(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/icons/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_icons(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/icons/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_icons(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_medals" do
    context "when the response is 200" do
      let(:response) { [{ "created_at" => "2017-10-10T14:00:00Z", "creator_id" => 46_578, "description" => "An Awesome Medal", "medal_id" => 123, "title" => "Awesome Medal" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_medals(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_medals(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_medals(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_medals(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_medals(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_medals(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_medals(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_medals(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_medals_issued" do
    context "when the response is 200" do
      let(:response) { [{ "character_id" => 45_678, "issued_at" => "2017-10-10T14:00:00Z", "issuer_id" => 67_890, "medal_id" => 123, "reason" => "Awesome Reason", "status" => "private" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/issued/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_medals_issued(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/issued/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_medals_issued(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/issued/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_medals_issued(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/issued/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_medals_issued(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/issued/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_medals_issued(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/issued/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_medals_issued(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/issued/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_medals_issued(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/medals/issued/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_medals_issued(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_member_titles" do
    context "when the response is 200" do
      let(:response) { [{ "character_id" => 12_345, "titles" => [] }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/titles/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_member_titles(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/titles/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_member_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/titles/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_member_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/titles/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_member_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/titles/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_member_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/titles/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_member_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/titles/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_member_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/titles/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_member_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_members" do
    context "when the response is 200" do
      let(:response) { [90_000_001, 90_000_002] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_members(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_members(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_members(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_members(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_members(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_members(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_members(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_members(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_members_limit" do
    context "when the response is 200" do
      let(:response) { 40 }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/limit/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_members_limit(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/limit/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_members_limit(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/limit/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_members_limit(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/limit/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_members_limit(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/limit/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_members_limit(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/limit/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_members_limit(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/limit/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_members_limit(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/members/limit/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_members_limit(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_membertracking" do
    context "when the response is 200" do
      let(:response) { [{ "character_id" => 2_112_000_001, "location_id" => 30_003_657, "logoff_date" => "2017-08-03T14:31:16Z", "logon_date" => "2017-08-03T14:22:03Z", "ship_type_id" => 22_464, "start_date" => "2017-07-10T14:46:00Z" }, { "character_id" => 2_112_000_002, "location_id" => 30_003_657, "logoff_date" => "2017-07-25T11:07:40Z", "logon_date" => "2017-07-25T10:54:00Z", "ship_type_id" => 670, "start_date" => "2017-07-10T14:50:00Z" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/membertracking/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_membertracking(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/membertracking/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_membertracking(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/membertracking/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_membertracking(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/membertracking/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_membertracking(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/membertracking/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_membertracking(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/membertracking/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_membertracking(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/membertracking/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_membertracking(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/membertracking/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_membertracking(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_npccorps" do
    context "when the response is 200" do
      let(:response) { [1_000_001, 1_000_002, 1_000_003] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/npccorps/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_npccorps).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/npccorps/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_npccorps }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/npccorps/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_npccorps }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/npccorps/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_npccorps }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/npccorps/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_npccorps }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/npccorps/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_npccorps }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_roles" do
    context "when the response is 200" do
      let(:response) { [{ "character_id" => 1_000_171, "roles" => %w[Director Station_Manager] }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_roles(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_roles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_roles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_roles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_roles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_roles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_roles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_roles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_roles_history" do
    context "when the response is 200" do
      let(:response) { [{ "changed_at" => "2016-10-25T14:46:00Z", "character_id" => 12_345, "issuer_id" => 45_678, "new_roles" => ["Station_Manager"], "old_roles" => ["Diplomat"], "role_type" => "roles" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/history/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_roles_history(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/history/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_roles_history(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/history/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_roles_history(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/history/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_roles_history(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/history/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_roles_history(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/history/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_roles_history(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/history/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_roles_history(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/roles/history/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_roles_history(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_shareholders" do
    context "when the response is 200" do
      let(:response) { [{ "share_count" => 580, "shareholder_id" => 98_000_001, "shareholder_type" => "corporation" }, { "share_count" => 20, "shareholder_id" => 2_112_000_003, "shareholder_type" => "character" }, { "share_count" => 300, "shareholder_id" => 2_112_000_004, "shareholder_type" => "character" }, { "share_count" => 100, "shareholder_id" => 2_112_000_001, "shareholder_type" => "character" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/shareholders/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_shareholders(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/shareholders/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_shareholders(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/shareholders/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_shareholders(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/shareholders/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_shareholders(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/shareholders/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_shareholders(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/shareholders/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_shareholders(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/shareholders/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_shareholders(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/shareholders/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_shareholders(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_standings" do
    context "when the response is 200" do
      let(:response) { [{ "from_id" => 3_009_841, "from_type" => "agent", "standing" => 0.1 }, { "from_id" => 1_000_061, "from_type" => "npc_corp", "standing" => 0 }, { "from_id" => 500_003, "from_type" => "faction", "standing" => -1 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/standings/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_standings(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/standings/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_standings(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/standings/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_standings(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/standings/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_standings(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/standings/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_standings(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/standings/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_standings(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/standings/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_standings(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/standings/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_standings(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_starbase" do
    context "when the response is 200" do
      let(:response) { { "allow_alliance_members" => false, "allow_corporation_members" => true, "anchor" => "config_starbase_equipment_role", "attack_if_at_war" => true, "attack_if_other_security_status_dropping" => false, "fuel_bay_take" => "config_starbase_equipment_role", "fuel_bay_view" => "config_starbase_equipment_role", "offline" => "config_starbase_equipment_role", "online" => "config_starbase_equipment_role", "unanchor" => "config_starbase_equipment_role", "use_alliance_standings" => false } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/1234567890/?system_id=1234567890").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_starbase(corporation_id: "1234567890", starbase_id: "1234567890", system_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/1234567890/?system_id=1234567890").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_starbase(corporation_id: "1234567890", starbase_id: "1234567890", system_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/1234567890/?system_id=1234567890").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_starbase(corporation_id: "1234567890", starbase_id: "1234567890", system_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/1234567890/?system_id=1234567890").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_starbase(corporation_id: "1234567890", starbase_id: "1234567890", system_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/1234567890/?system_id=1234567890").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_starbase(corporation_id: "1234567890", starbase_id: "1234567890", system_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/1234567890/?system_id=1234567890").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_starbase(corporation_id: "1234567890", starbase_id: "1234567890", system_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/1234567890/?system_id=1234567890").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_starbase(corporation_id: "1234567890", starbase_id: "1234567890", system_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/1234567890/?system_id=1234567890").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_starbase(corporation_id: "1234567890", starbase_id: "1234567890", system_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_starbases" do
    context "when the response is 200" do
      let(:response) { [{ "starbase_id" => 12_345, "system_id" => 123_456, "type_id" => 456 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_starbases(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_starbases(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_starbases(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_starbases(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_starbases(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_starbases(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_starbases(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/starbases/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_starbases(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_structures" do
    context "when the response is 200" do
      let(:response) { [{ "corporation_id" => 667_531_913, "name" => "example name", "profile_id" => 11_237, "reinforce_hour" => 22, "state" => "shield_vulnerable", "structure_id" => 1_021_975_535_893, "system_id" => 30_004_763, "type_id" => 35_833 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/structures/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_structures(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/structures/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_structures(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/structures/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_structures(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/structures/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_structures(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/structures/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_structures(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/structures/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_structures(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/structures/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_structures(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/structures/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_structures(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_titles" do
    context "when the response is 200" do
      let(:response) { [{ "name" => "Awesome Title", "roles" => %w[Hangar_Take_6 Hangar_Query_2], "title_id" => 1 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/titles/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_titles(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/titles/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/titles/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/titles/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/titles/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/titles/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/titles/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/titles/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_titles(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end
end
