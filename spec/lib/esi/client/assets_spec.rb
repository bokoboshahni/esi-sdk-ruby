# frozen_string_literal: true

RSpec.describe ESI::Client::Asset, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_character_assets" do
    context "when the response is 200" do
      let(:response) { [{ "is_blueprint_copy" => true, "is_singleton" => true, "item_id" => 1_000_000_016_835, "location_flag" => "Hangar", "location_id" => 60_002_959, "location_type" => "station", "quantity" => 1, "type_id" => 3516 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/assets/").to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_character_assets(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/assets/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_assets(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/assets/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_assets(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/assets/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_assets(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Requested page does not exist" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/assets/").to_return(body: response.to_json, status: 404, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_character_assets(character_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/assets/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_assets(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/assets/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_assets(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_assets" do
    context "when the response is 200" do
      let(:response) { [{ "is_blueprint_copy" => true, "is_singleton" => true, "item_id" => 1_000_000_016_835, "location_flag" => "Hangar", "location_id" => 60_002_959, "location_type" => "station", "quantity" => 1, "type_id" => 3516 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/assets/").to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_corporation_assets(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/assets/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_assets(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/assets/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_assets(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/assets/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_assets(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/assets/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_assets(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/assets/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_assets(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_character_asset_locations" do
    context "when the response is 200" do
      let(:response) { [{ "item_id" => 12_345, "position" => { "x" => 1.2, "y" => 2.3, "z" => -3.4 } }] }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/locations/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_character_asset_locations(character_id: "1234567890", item_ids: [1, 2, 3])).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/locations/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_character_asset_locations(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/locations/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_character_asset_locations(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/locations/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_character_asset_locations(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/locations/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_character_asset_locations(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/locations/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_character_asset_locations(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_character_asset_names" do
    context "when the response is 200" do
      let(:response) { [{ "item_id" => 12_345, "name" => "Awesome Name" }] }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/names/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_character_asset_names(character_id: "1234567890", item_ids: [1, 2, 3])).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/names/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_character_asset_names(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/names/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_character_asset_names(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/names/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_character_asset_names(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/names/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_character_asset_names(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/assets/names/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_character_asset_names(character_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_corporation_asset_locations" do
    context "when the response is 200" do
      let(:response) { [{ "item_id" => 12_345, "position" => { "x" => 1.2, "y" => 2.3, "z" => -3.4 } }] }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/locations/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_corporation_asset_locations(corporation_id: "1234567890", item_ids: [1, 2, 3])).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/locations/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_corporation_asset_locations(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/locations/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_corporation_asset_locations(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/locations/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_corporation_asset_locations(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/locations/").to_return(body: response.to_json, status: 404, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.post_corporation_asset_locations(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/locations/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_corporation_asset_locations(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/locations/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_corporation_asset_locations(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_corporation_asset_names" do
    context "when the response is 200" do
      let(:response) { [{ "item_id" => 12_345, "name" => "Awesome Name" }] }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/names/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_corporation_asset_names(corporation_id: "1234567890", item_ids: [1, 2, 3])).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/names/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_corporation_asset_names(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/names/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_corporation_asset_names(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/names/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_corporation_asset_names(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/names/").to_return(body: response.to_json, status: 404, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.post_corporation_asset_names(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/names/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_corporation_asset_names(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/corporations/1234567890/assets/names/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_corporation_asset_names(corporation_id: "1234567890", item_ids: [1, 2, 3]) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
