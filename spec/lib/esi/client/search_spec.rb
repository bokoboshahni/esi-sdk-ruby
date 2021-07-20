# frozen_string_literal: true

RSpec.describe ESI::Client::Search, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_character_search" do
    context "when the response is 200" do
      let(:response) { { "solar_system" => [30_002_510], "station" => [60_004_588, 60_004_594, 60_005_725, 60_009_106, 60_012_721, 60_012_724, 60_012_727] } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_search(character_id: "1234567890", categories: "1234567890", search: "1234567890", strict: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_search(character_id: "1234567890", categories: "1234567890", search: "1234567890", strict: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_search(character_id: "1234567890", categories: "1234567890", search: "1234567890", strict: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_search(character_id: "1234567890", categories: "1234567890", search: "1234567890", strict: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_search(character_id: "1234567890", categories: "1234567890", search: "1234567890", strict: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_search(character_id: "1234567890", categories: "1234567890", search: "1234567890", strict: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_search" do
    context "when the response is 200" do
      let(:response) { { "solar_system" => [30_002_510], "station" => [60_004_588, 60_004_594, 60_005_725, 60_009_106, 60_012_721, 60_012_724, 60_012_727] } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_search(categories: "1234567890", search: "1234567890", strict: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_search(categories: "1234567890", search: "1234567890", strict: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_search(categories: "1234567890", search: "1234567890", strict: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/search/").with(query: { categories: "1234567890", search: "1234567890", strict: "1234567890" }).to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_search(categories: "1234567890", search: "1234567890", strict: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
