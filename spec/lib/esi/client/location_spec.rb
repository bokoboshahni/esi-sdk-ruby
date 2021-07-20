# frozen_string_literal: true

RSpec.describe ESI::Client::Location, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_character_location" do
    context "when the response is 200" do
      let(:response) { { "solar_system_id" => 30_002_505, "structure_id" => 1_000_000_016_989 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/location/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_location(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/location/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_location(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/location/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_location(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/location/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_location(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/location/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_location(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/location/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_location(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_character_online" do
    context "when the response is 200" do
      let(:response) { { "last_login" => "2017-01-02T03:04:05Z", "last_logout" => "2017-01-02T04:05:06Z", "logins" => 9001, "online" => true } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/online/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_online(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/online/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_online(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/online/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_online(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/online/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_online(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/online/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_online(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/online/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_online(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_character_ship" do
    context "when the response is 200" do
      let(:response) { { "ship_item_id" => 1_000_000_016_991, "ship_name" => "SPACESHIPS!!!", "ship_type_id" => 1233 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/ship/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_ship(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/ship/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_ship(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/ship/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_ship(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/ship/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_ship(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/ship/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_ship(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/ship/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_ship(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
