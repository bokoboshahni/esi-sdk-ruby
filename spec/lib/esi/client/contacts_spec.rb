# frozen_string_literal: true

RSpec.describe ESI::Client::Contact do
  subject(:client) { ESI::Client.new(user_agent: "ESI SDK Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk)") }

  describe "#delete_character_contacts" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/contacts/?contact_ids=1234567890").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.delete_character_contacts(character_id: "1234567890", contact_ids: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/contacts/?contact_ids=1234567890").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.delete_character_contacts(character_id: "1234567890", contact_ids: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/contacts/?contact_ids=1234567890").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.delete_character_contacts(character_id: "1234567890", contact_ids: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/contacts/?contact_ids=1234567890").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.delete_character_contacts(character_id: "1234567890", contact_ids: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/contacts/?contact_ids=1234567890").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.delete_character_contacts(character_id: "1234567890", contact_ids: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/contacts/?contact_ids=1234567890").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.delete_character_contacts(character_id: "1234567890", contact_ids: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/contacts/?contact_ids=1234567890").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.delete_character_contacts(character_id: "1234567890", contact_ids: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/contacts/?contact_ids=1234567890").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.delete_character_contacts(character_id: "1234567890", contact_ids: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_alliance_contact_labels" do
    context "when the response is 200" do
      let(:response) { [{ "label_id" => 1, "label_name" => "Alliance Friends" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_alliance_contact_labels(alliance_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_alliance_contact_labels(alliance_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_alliance_contact_labels(alliance_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_alliance_contact_labels(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_alliance_contact_labels(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_alliance_contact_labels(alliance_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_alliance_contact_labels(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_alliance_contact_labels(alliance_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_alliance_contacts" do
    context "when the response is 200" do
      let(:response) { [{ "contact_id" => 2_112_625_428, "contact_type" => "character", "standing" => 9.9 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_alliance_contacts(alliance_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_alliance_contacts(alliance_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_alliance_contacts(alliance_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_alliance_contacts(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_alliance_contacts(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_alliance_contacts(alliance_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_alliance_contacts(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/contacts/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_alliance_contacts(alliance_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_character_contact_labels" do
    context "when the response is 200" do
      let(:response) { [{ "label_id" => 123, "label_name" => "Friends" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/labels/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_contact_labels(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/labels/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_contact_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/labels/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_contact_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/labels/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_contact_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/labels/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_contact_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/labels/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_contact_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/labels/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_character_contact_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/labels/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_character_contact_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_character_contacts" do
    context "when the response is 200" do
      let(:response) { [{ "contact_id" => 123, "contact_type" => "character", "is_blocked" => true, "is_watched" => true, "standing" => 9.9 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_contacts(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_contacts(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_contacts(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_contacts(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_contacts(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_contacts(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_character_contacts(character_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contacts/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_character_contacts(character_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_contact_labels" do
    context "when the response is 200" do
      let(:response) { [{ "label_id" => 2, "label_name" => "Corporation Friends" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_contact_labels(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_contact_labels(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_contact_labels(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_contact_labels(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_contact_labels(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_contact_labels(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_contact_labels(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_contact_labels(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_corporation_contacts" do
    context "when the response is 200" do
      let(:response) { [{ "contact_id" => 123, "contact_type" => "character", "is_watched" => true, "standing" => 9.9 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_contacts(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_contacts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_contacts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_contacts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_contacts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_contacts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_corporation_contacts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contacts/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_corporation_contacts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#post_character_contacts" do
    context "when the response is 201" do
      let(:response) { [123, 456] }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3])).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end

    context "when the response is 520" do
      let(:response) { { "error" => "Error 520 message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 520)
      end

      it "raises a ESI::Errors::EveServerError error" do
        expect { client.post_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::EveServerError)
      end
    end
  end

  describe "#put_character_contacts" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.put_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3])).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.put_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.put_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.put_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.put_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.put_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.put_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/contacts/?label_ids=1234567890&standing=1234567890&watched=1234567890").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.put_character_contacts(character_id: "1234567890", label_ids: "1234567890", standing: "1234567890", watched: "1234567890", contact_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end
end
