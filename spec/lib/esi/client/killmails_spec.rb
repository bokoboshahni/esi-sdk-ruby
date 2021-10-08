# frozen_string_literal: true

RSpec.describe ESI::Client::Killmail, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_character_killmails_recent" do
    context "when the response is 200" do
      let(:response) { [{ "killmail_hash" => "8eef5e8fb6b88fe3407c489df33822b2e3b57a5e", "killmail_id" => 2 }, { "killmail_hash" => "b41ccb498ece33d64019f64c0db392aa3aa701fb", "killmail_id" => 1 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/killmails/recent/").to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_character_killmails_recent(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/killmails/recent/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_killmails_recent(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/killmails/recent/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_killmails_recent(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/killmails/recent/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_killmails_recent(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/killmails/recent/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_killmails_recent(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/killmails/recent/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_killmails_recent(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_killmails_recent" do
    context "when the response is 200" do
      let(:response) { [{ "killmail_hash" => "8eef5e8fb6b88fe3407c489df33822b2e3b57a5e", "killmail_id" => 2 }, { "killmail_hash" => "b41ccb498ece33d64019f64c0db392aa3aa701fb", "killmail_id" => 1 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/killmails/recent/").to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_corporation_killmails_recent(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/killmails/recent/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_killmails_recent(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/killmails/recent/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_killmails_recent(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/killmails/recent/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_killmails_recent(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/killmails/recent/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_killmails_recent(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/killmails/recent/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_killmails_recent(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_killmail_killmail_hash" do
    context "when the response is 200" do
      let(:response) { { "attackers" => [{ "character_id" => 95_810_944, "corporation_id" => 1_000_179, "damage_done" => 5745, "faction_id" => 500_003, "final_blow" => true, "security_status" => -0.3, "ship_type_id" => 17_841, "weapon_type_id" => 3074 }], "killmail_id" => 56_733_821, "killmail_time" => "2016-10-22T17:13:36Z", "solar_system_id" => 30_002_976, "victim" => { "alliance_id" => 621_338_554, "character_id" => 92_796_241, "corporation_id" => 841_363_671, "damage_taken" => 5745, "items" => [{ "flag" => 20, "item_type_id" => 5973, "quantity_dropped" => 1, "singleton" => 0 }], "position" => { "x" => 452_186_600_569.4748, "y" => 146_704_961_490.90222, "z" => 109_514_596_532.54477 }, "ship_type_id" => 17_812 } } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/killmails/1234567890/1234567890/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_killmail_killmail_hash(killmail_hash: "1234567890", killmail_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/killmails/1234567890/1234567890/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_killmail_killmail_hash(killmail_hash: "1234567890", killmail_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/killmails/1234567890/1234567890/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_killmail_killmail_hash(killmail_hash: "1234567890", killmail_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 422" do
      let(:response) { { "error" => "Unprocessable entity message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/killmails/1234567890/1234567890/").to_return(body: response.to_json, status: 422, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnprocessableEntityError error" do
        expect { client.get_killmail_killmail_hash(killmail_hash: "1234567890", killmail_id: "1234567890") }.to raise_error(ESI::Errors::UnprocessableEntityError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/killmails/1234567890/1234567890/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_killmail_killmail_hash(killmail_hash: "1234567890", killmail_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
