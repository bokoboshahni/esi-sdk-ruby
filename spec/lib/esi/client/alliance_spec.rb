# frozen_string_literal: true

RSpec.describe ESI::Client::Alliance, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_alliance" do
    context "when the response is 200" do
      let(:response) { { "creator_corporation_id" => 45_678, "creator_id" => 12_345, "date_founded" => "2016-06-26T21:00:00Z", "executor_corporation_id" => 98_356_193, "name" => "C C P Alliance", "ticker" => "<C C P>" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_alliance(alliance_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_alliance(alliance_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/").to_return(body: response.to_json, status: 404, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_alliance(alliance_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_alliance(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_alliance(alliance_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_alliance_corporations" do
    context "when the response is 200" do
      let(:response) { [98_000_001] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/corporations/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_alliance_corporations(alliance_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/corporations/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_alliance_corporations(alliance_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/corporations/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_alliance_corporations(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/corporations/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_alliance_corporations(alliance_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_alliance_icons" do
    context "when the response is 200" do
      let(:response) { { "px128x128" => "https://images.evetech.net/Alliance/503818424_128.png", "px64x64" => "https://images.evetech.net/Alliance/503818424_64.png" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/icons/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_alliance_icons(alliance_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/icons/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_alliance_icons(alliance_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "No image server for this datasource" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/icons/").to_return(body: response.to_json, status: 404, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_alliance_icons(alliance_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/icons/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_alliance_icons(alliance_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/1234567890/icons/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_alliance_icons(alliance_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_alliances" do
    context "when the response is 200" do
      let(:response) { [99_000_001, 99_000_002] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_alliances).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_alliances }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_alliances }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/alliances/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_alliances }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
