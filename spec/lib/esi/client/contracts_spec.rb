# frozen_string_literal: true

RSpec.describe ESI::Client::Contract, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_character_contract_bids" do
    context "when the response is 200" do
      let(:response) { [{ "amount" => 1.23, "bid_id" => 1, "bidder_id" => 123, "date_bid" => "2017-01-01T10:10:10Z" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_contract_bids(character_id: "1234567890", contract_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_contract_bids(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_contract_bids(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_contract_bids(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_character_contract_bids(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_contract_bids(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_contract_bids(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_character_contract_items" do
    context "when the response is 200" do
      let(:response) { [{ "is_included" => true, "is_singleton" => false, "quantity" => 1, "record_id" => 123_456, "type_id" => 587 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/items/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_contract_items(character_id: "1234567890", contract_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_contract_items(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_contract_items(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_contract_items(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_character_contract_items(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_contract_items(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_contract_items(character_id: "1234567890", contract_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_character_contracts" do
    context "when the response is 200" do
      let(:response) { [{ "acceptor_id" => 0, "assignee_id" => 0, "availability" => "public", "buyout" => 10_000_000_000.01, "contract_id" => 1, "date_accepted" => "2017-06-06T13:12:32Z", "date_completed" => "2017-06-06T13:12:32Z", "date_expired" => "2017-06-13T13:12:32Z", "date_issued" => "2017-06-06T13:12:32Z", "days_to_complete" => 0, "end_location_id" => 60_014_719, "for_corporation" => true, "issuer_corporation_id" => 456, "issuer_id" => 123, "price" => 1_000_000.01, "reward" => 0.01, "start_location_id" => 60_014_719, "status" => "outstanding", "type" => "auction", "volume" => 0.01 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_contracts(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_contracts(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_contracts(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_contracts(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_contracts(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/contracts/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_contracts(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_contracts_public_bids_contract" do
    context "when the response is 200" do
      let(:response) { [{ "amount" => 1.23, "bid_id" => 1, "date_bid" => "2017-01-01T10:10:10Z" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/bids/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_contracts_public_bids_contract(contract_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/bids/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_contracts_public_bids_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/bids/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_contracts_public_bids_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/bids/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_contracts_public_bids_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/bids/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_contracts_public_bids_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/bids/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_contracts_public_bids_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_contracts_public_items_contract" do
    context "when the response is 200" do
      let(:response) { [{ "is_included" => true, "item_id" => 123_456, "quantity" => 1, "record_id" => 123_456, "type_id" => 587 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/items/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_contracts_public_items_contract(contract_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/items/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_contracts_public_items_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/items/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_contracts_public_items_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/items/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_contracts_public_items_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/items/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_contracts_public_items_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/items/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_contracts_public_items_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_contracts_public_region" do
    context "when the response is 200" do
      let(:response) { [{ "buyout" => 10_000_000_000.01, "contract_id" => 1, "date_expired" => "2017-06-13T13:12:32Z", "date_issued" => "2017-06-06T13:12:32Z", "days_to_complete" => 0, "end_location_id" => 60_014_719, "for_corporation" => true, "issuer_corporation_id" => 456, "issuer_id" => 123, "price" => 1_000_000.01, "reward" => 0.01, "start_location_id" => 60_014_719, "type" => "auction", "volume" => 0.01 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_contracts_public_region(region_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_contracts_public_region(region_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_contracts_public_region(region_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_contracts_public_region(region_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/contracts/public/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_contracts_public_region(region_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_contract_bids" do
    context "when the response is 200" do
      let(:response) { [{ "amount" => 1.23, "bid_id" => 1, "bidder_id" => 123, "date_bid" => "2017-01-01T10:10:10Z" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_contract_bids(contract_id: "1234567890", corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_contract_bids(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_contract_bids(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_contract_bids(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_corporation_contract_bids(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_contract_bids(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/bids/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_contract_bids(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_contract_items" do
    context "when the response is 200" do
      let(:response) { [{ "is_included" => true, "is_singleton" => false, "quantity" => 1, "record_id" => 123_456, "type_id" => 587 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/items/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_contract_items(contract_id: "1234567890", corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_contract_items(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_contract_items(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_contract_items(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_corporation_contract_items(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_contract_items(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_contract_items(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 520" do
      let(:response) { { "error" => "Error 520 message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/1234567890/items/").to_return(body: response.to_json, status: 520)
      end

      it "raises a ESI::Errors::EveServerError error" do
        expect { client.get_corporation_contract_items(contract_id: "1234567890", corporation_id: "1234567890") }.to raise_error(ESI::Errors::EveServerError)
      end
    end
  end

  describe "#get_corporation_contracts" do
    context "when the response is 200" do
      let(:response) { [{ "acceptor_id" => 0, "assignee_id" => 0, "availability" => "public", "buyout" => 10_000_000_000.01, "contract_id" => 1, "date_expired" => "2017-06-13T13:12:32Z", "date_issued" => "2017-06-06T13:12:32Z", "days_to_complete" => 0, "end_location_id" => 60_014_719, "for_corporation" => true, "issuer_corporation_id" => 456, "issuer_id" => 123, "price" => 1_000_000.01, "reward" => 0.01, "start_location_id" => 60_014_719, "status" => "outstanding", "type" => "auction", "volume" => 0.01 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_corporation_contracts(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_contracts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_contracts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_contracts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_contracts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/contracts/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_contracts(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
