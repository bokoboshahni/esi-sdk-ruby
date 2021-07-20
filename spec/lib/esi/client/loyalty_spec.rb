# frozen_string_literal: true

RSpec.describe ESI::Client::Loyalty, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_character_loyalty_points" do
    context "when the response is 200" do
      let(:response) { [{ "corporation_id" => 123, "loyalty_points" => 100 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/loyalty/points/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_loyalty_points(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/loyalty/points/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_loyalty_points(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/loyalty/points/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_loyalty_points(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/loyalty/points/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_loyalty_points(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/loyalty/points/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_loyalty_points(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/loyalty/points/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_loyalty_points(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_loyalty_stores_corporation_offers" do
    context "when the response is 200" do
      let(:response) { [{ "ak_cost" => 35_000, "isk_cost" => 0, "lp_cost" => 100, "offer_id" => 1, "quantity" => 1, "required_items" => [], "type_id" => 123 }, { "isk_cost" => 1000, "lp_cost" => 100, "offer_id" => 2, "quantity" => 10, "required_items" => [{ "quantity" => 10, "type_id" => 1234 }], "type_id" => 1235 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/loyalty/stores/1234567890/offers/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_loyalty_stores_corporation_offers(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/loyalty/stores/1234567890/offers/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_loyalty_stores_corporation_offers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/loyalty/stores/1234567890/offers/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_loyalty_stores_corporation_offers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/loyalty/stores/1234567890/offers/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_loyalty_stores_corporation_offers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/loyalty/stores/1234567890/offers/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_loyalty_stores_corporation_offers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
