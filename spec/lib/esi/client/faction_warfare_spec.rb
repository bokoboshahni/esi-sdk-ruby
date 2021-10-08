# frozen_string_literal: true

RSpec.describe ESI::Client::FactionWarfare, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_character_fw_stats" do
    context "when the response is 200" do
      let(:response) { { "enlisted_on" => "2017-10-17T00:00:00Z", "faction_id" => 500_001, "kills" => { "last_week" => 893, "total" => 684_350, "yesterday" => 136 }, "victory_points" => { "last_week" => 102_640, "total" => 52_658_260, "yesterday" => 15_980 } } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/fw/stats/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_character_fw_stats(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/fw/stats/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_fw_stats(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/fw/stats/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_fw_stats(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/fw/stats/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_fw_stats(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/fw/stats/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_fw_stats(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/fw/stats/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_fw_stats(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_fw_stats" do
    context "when the response is 200" do
      let(:response) { { "enlisted_on" => "2017-10-17T00:00:00Z", "faction_id" => 500_001, "kills" => { "last_week" => 893, "total" => 684_350, "yesterday" => 136 }, "pilots" => 28_863, "victory_points" => { "last_week" => 102_640, "total" => 52_658_260, "yesterday" => 15_980 } } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/fw/stats/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_corporation_fw_stats(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/fw/stats/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_fw_stats(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/fw/stats/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_fw_stats(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/fw/stats/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_fw_stats(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/fw/stats/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_fw_stats(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/fw/stats/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_fw_stats(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_fw_leaderboard_characters" do
    context "when the response is 200" do
      let(:response) { { "kills" => { "active_total" => [{ "amount" => 10_000, "character_id" => 2_112_625_428 }, { "amount" => 8500, "character_id" => 95_465_499 }], "last_week" => [{ "amount" => 100, "character_id" => 2_112_625_428 }, { "amount" => 70, "character_id" => 95_465_499 }], "yesterday" => [{ "amount" => 34, "character_id" => 2_112_625_428 }, { "amount" => 20, "character_id" => 95_465_499 }] }, "victory_points" => { "active_total" => [{ "amount" => 1_239_158, "character_id" => 2_112_625_428 }, { "amount" => 1_139_029, "character_id" => 95_465_499 }], "last_week" => [{ "amount" => 2660, "character_id" => 2_112_625_428 }, { "amount" => 2000, "character_id" => 95_465_499 }], "yesterday" => [{ "amount" => 620, "character_id" => 2_112_625_428 }, { "amount" => 550, "character_id" => 95_465_499 }] } } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/characters/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_fw_leaderboard_characters).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/characters/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_fw_leaderboard_characters }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/characters/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_fw_leaderboard_characters }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/characters/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_fw_leaderboard_characters }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_fw_leaderboard_corporations" do
    context "when the response is 200" do
      let(:response) { { "kills" => { "active_total" => [{ "amount" => 81_692, "corporation_id" => 1_000_180 }, { "amount" => 76_793, "corporation_id" => 1_000_182 }], "last_week" => [{ "amount" => 290, "corporation_id" => 1_000_180 }, { "amount" => 169, "corporation_id" => 1_000_182 }], "yesterday" => [{ "amount" => 51, "corporation_id" => 1_000_180 }, { "amount" => 39, "corporation_id" => 1_000_182 }] }, "victory_points" => { "active_total" => [{ "amount" => 18_640_927, "corporation_id" => 1_000_180 }, { "amount" => 18_078_265, "corporation_id" => 1_000_181 }], "last_week" => [{ "amount" => 91_980, "corporation_id" => 1_000_180 }, { "amount" => 58_920, "corporation_id" => 1_000_181 }], "yesterday" => [{ "amount" => 12_600, "corporation_id" => 1_000_180 }, { "amount" => 8240, "corporation_id" => 1_000_181 }] } } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/corporations/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_fw_leaderboard_corporations).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/corporations/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_fw_leaderboard_corporations }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/corporations/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_fw_leaderboard_corporations }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/corporations/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_fw_leaderboard_corporations }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_fw_leaderboards" do
    context "when the response is 200" do
      let(:response) { { "kills" => { "active_total" => [{ "amount" => 832_273, "faction_id" => 500_004 }, { "amount" => 687_915, "faction_id" => 500_001 }], "last_week" => [{ "amount" => 730, "faction_id" => 500_001 }, { "amount" => 671, "faction_id" => 500_004 }], "yesterday" => [{ "amount" => 100, "faction_id" => 500_001 }, { "amount" => 50, "faction_id" => 500_004 }] }, "victory_points" => { "active_total" => [{ "amount" => 53_130_500, "faction_id" => 500_001 }, { "amount" => 50_964_263, "faction_id" => 500_004 }], "last_week" => [{ "amount" => 97_360, "faction_id" => 500_001 }, { "amount" => 84_980, "faction_id" => 500_004 }], "yesterday" => [{ "amount" => 5000, "faction_id" => 500_002 }, { "amount" => 3500, "faction_id" => 500_003 }] } } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_fw_leaderboards).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_fw_leaderboards }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_fw_leaderboards }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/leaderboards/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_fw_leaderboards }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_fw_stats" do
    context "when the response is 200" do
      let(:response) { [{ "faction_id" => 500_001, "kills" => { "last_week" => 893, "total" => 684_350, "yesterday" => 136 }, "pilots" => 28_863, "systems_controlled" => 20, "victory_points" => { "last_week" => 102_640, "total" => 52_658_260, "yesterday" => 15_980 } }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/stats/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_fw_stats).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/stats/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_fw_stats }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/stats/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_fw_stats }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/stats/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_fw_stats }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_fw_systems" do
    context "when the response is 200" do
      let(:response) { [{ "contested" => "uncontested", "occupier_faction_id" => 500_001, "owner_faction_id" => 500_001, "solar_system_id" => 30_002_096, "victory_points" => 60, "victory_points_threshold" => 3000 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/systems/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_fw_systems).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/systems/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_fw_systems }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/systems/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_fw_systems }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/systems/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_fw_systems }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_fw_wars" do
    context "when the response is 200" do
      let(:response) { [{ "against_id" => 500_002, "faction_id" => 500_001 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/wars/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_fw_wars).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/wars/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_fw_wars }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/wars/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_fw_wars }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/fw/wars/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_fw_wars }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
