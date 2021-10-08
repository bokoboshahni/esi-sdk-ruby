# frozen_string_literal: true

RSpec.describe ESI::Client::Industry, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_character_industry_jobs" do
    context "when the response is 200" do
      let(:response) { [{ "activity_id" => 1, "blueprint_id" => 1_015_116_533_326, "blueprint_location_id" => 60_006_382, "blueprint_type_id" => 2047, "cost" => 118.01, "duration" => 548, "end_date" => "2014-07-19T15:56:14Z", "facility_id" => 60_006_382, "installer_id" => 498_338_451, "job_id" => 229_136_101, "licensed_runs" => 200, "output_location_id" => 60_006_382, "runs" => 1, "start_date" => "2014-07-19T15:47:06Z", "station_id" => 60_006_382, "status" => "active" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_character_industry_jobs(character_id: "1234567890", include_completed: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_industry_jobs(character_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_industry_jobs(character_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_industry_jobs(character_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_industry_jobs(character_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_industry_jobs(character_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_character_mining" do
    context "when the response is 200" do
      let(:response) { [{ "date" => "2017-09-19", "quantity" => 7004, "solar_system_id" => 30_003_707, "type_id" => 17_471 }, { "date" => "2017-09-18", "quantity" => 5199, "solar_system_id" => 30_003_707, "type_id" => 17_471 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mining/").to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_character_mining(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mining/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_mining(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mining/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_mining(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mining/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_mining(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mining/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_mining(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mining/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_mining(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_industry_jobs" do
    context "when the response is 200" do
      let(:response) { [{ "activity_id" => 1, "blueprint_id" => 1_015_116_533_326, "blueprint_location_id" => 60_006_382, "blueprint_type_id" => 2047, "cost" => 118.01, "duration" => 548, "end_date" => "2014-07-19T15:56:14Z", "facility_id" => 60_006_382, "installer_id" => 498_338_451, "job_id" => 229_136_101, "licensed_runs" => 200, "location_id" => 60_006_382, "output_location_id" => 60_006_382, "runs" => 1, "start_date" => "2014-07-19T15:47:06Z", "status" => "active" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_corporation_industry_jobs(corporation_id: "1234567890", include_completed: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_industry_jobs(corporation_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_industry_jobs(corporation_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_industry_jobs(corporation_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_industry_jobs(corporation_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporations/1234567890/industry/jobs/").with(query: { include_completed: "1234567890" }).to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_industry_jobs(corporation_id: "1234567890", include_completed: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_mining_extractions" do
    context "when the response is 200" do
      let(:response) { [{ "chunk_arrival_time" => "2017-10-17T11:00:59Z", "extraction_start_time" => "2017-10-11T10:37:04Z", "moon_id" => 40_307_229, "natural_decay_time" => "2017-10-17T14:00:59Z", "structure_id" => 1_000_000_010_579 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/extractions/").to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_corporation_mining_extractions(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/extractions/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_mining_extractions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/extractions/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_mining_extractions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/extractions/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_mining_extractions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/extractions/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_mining_extractions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/extractions/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_mining_extractions(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_mining_observer" do
    context "when the response is 200" do
      let(:response) { [{ "character_id" => 95_465_499, "last_updated" => "2017-09-19", "quantity" => 500, "recorded_corporation_id" => 109_299_958, "type_id" => 1230 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/1234567890/").to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_corporation_mining_observer(corporation_id: "1234567890", observer_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/1234567890/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_mining_observer(corporation_id: "1234567890", observer_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/1234567890/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_mining_observer(corporation_id: "1234567890", observer_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/1234567890/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_mining_observer(corporation_id: "1234567890", observer_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/1234567890/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_mining_observer(corporation_id: "1234567890", observer_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/1234567890/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_mining_observer(corporation_id: "1234567890", observer_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_corporation_mining_observers" do
    context "when the response is 200" do
      let(:response) { [{ "last_updated" => "2017-09-19", "observer_id" => 1, "observer_type" => "structure" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/").to_return(body: response.to_json, headers: { "Content-Type": "application/json", "X-Pages": "1" })
      end

      it "returns the response" do
        expect(client.get_corporation_mining_observers(corporation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_corporation_mining_observers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_corporation_mining_observers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_corporation_mining_observers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_corporation_mining_observers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/corporation/1234567890/mining/observers/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_corporation_mining_observers(corporation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_industry_facilities" do
    context "when the response is 200" do
      let(:response) { [{ "facility_id" => 60_012_544, "owner_id" => 1_000_126, "region_id" => 10_000_001, "solar_system_id" => 30_000_032, "tax" => 0.1, "type_id" => 2502 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/industry/facilities/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_industry_facilities).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/industry/facilities/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_industry_facilities }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/industry/facilities/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_industry_facilities }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/industry/facilities/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_industry_facilities }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_industry_systems" do
    context "when the response is 200" do
      let(:response) { [{ "cost_indices" => [{ "activity" => "invention", "cost_index" => 0.0048 }], "solar_system_id" => 30_011_392 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/industry/systems/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.get_industry_systems).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/industry/systems/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_industry_systems }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/industry/systems/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_industry_systems }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/industry/systems/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_industry_systems }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
