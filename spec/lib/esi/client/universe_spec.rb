# frozen_string_literal: true

RSpec.describe ESI::Client::Universe, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_universe_ancestries" do
    context "when the response is 200" do
      let(:response) { [{ "bloodline_id" => 1, "description" => "Acutely aware of the small population...", "id" => 12, "name" => "Tube Child", "short_description" => "Manufactured citizens of the State." }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/ancestries/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_ancestries).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/ancestries/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_ancestries }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/ancestries/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_ancestries }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/ancestries/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_ancestries }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_asteroid_belt" do
    context "when the response is 200" do
      let(:response) { { "name" => "Tanoo I - Asteroid Belt 1", "position" => { "x" => 161_967_513_600, "y" => 21_288_837_120, "z" => -73_505_464_320 }, "system_id" => 30_000_001 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/asteroid_belts/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_asteroid_belt(asteroid_belt_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/asteroid_belts/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_asteroid_belt(asteroid_belt_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/asteroid_belts/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_asteroid_belt(asteroid_belt_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/asteroid_belts/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_asteroid_belt(asteroid_belt_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/asteroid_belts/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_asteroid_belt(asteroid_belt_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_bloodlines" do
    context "when the response is 200" do
      let(:response) { [{ "bloodline_id" => 1, "charisma" => 6, "corporation_id" => 1_000_006, "description" => "The Deteis are regarded as ...", "intelligence" => 7, "memory" => 7, "name" => "Deteis", "perception" => 5, "race_id" => 1, "ship_type_id" => 601, "willpower" => 5 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/bloodlines/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_bloodlines).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/bloodlines/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_bloodlines }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/bloodlines/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_bloodlines }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/bloodlines/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_bloodlines }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_categories" do
    context "when the response is 200" do
      let(:response) { [1, 2, 3] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_categories).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_categories }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_categories }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_categories }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_categories_category" do
    context "when the response is 200" do
      let(:response) { { "category_id" => 6, "groups" => [25, 26, 27], "name" => "Ship", "published" => true } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_categories_category(category_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_categories_category(category_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_categories_category(category_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_categories_category(category_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/categories/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_categories_category(category_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_constellation" do
    context "when the response is 200" do
      let(:response) { { "constellation_id" => 20_000_009, "name" => "Mekashtad", "position" => { "x" => 67_796_138_757_472_320, "y" => -70_591_121_348_560_960, "z" => -59_587_016_159_270_070 }, "region_id" => 10_000_001, "systems" => [20_000_302, 20_000_303] } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_constellation(constellation_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_constellation(constellation_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_constellation(constellation_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_constellation(constellation_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_constellation(constellation_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_constellations" do
    context "when the response is 200" do
      let(:response) { [20_000_001, 20_000_002] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_constellations).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_constellations }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_constellations }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/constellations/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_constellations }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_factions" do
    context "when the response is 200" do
      let(:response) { [{ "corporation_id" => 456, "description" => "blah blah", "faction_id" => 1, "is_unique" => true, "name" => "Faction", "size_factor" => 1.0, "solar_system_id" => 123, "station_count" => 1000, "station_system_count" => 100 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/factions/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_factions).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/factions/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_factions }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/factions/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_factions }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/factions/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_factions }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_graphic" do
    context "when the response is 200" do
      let(:response) { { "graphic_file" => "res:/dx9/model/worldobject/planet/moon.red", "graphic_id" => 10 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_graphic(graphic_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_graphic(graphic_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_graphic(graphic_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_graphic(graphic_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_graphic(graphic_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_graphics" do
    context "when the response is 200" do
      let(:response) { [10, 4106] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_graphics).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_graphics }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_graphics }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/graphics/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_graphics }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_group" do
    context "when the response is 200" do
      let(:response) { { "category_id" => 6, "group_id" => 25, "name" => "Frigate", "published" => true, "types" => [587, 586, 585] } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_group(group_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_group(group_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_group(group_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_group(group_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_group(group_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_groups" do
    context "when the response is 200" do
      let(:response) { [1, 2, 3] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_groups).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_groups }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_groups }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/groups/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_groups }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_moon" do
    context "when the response is 200" do
      let(:response) { { "moon_id" => 40_000_042, "name" => "Akpivem I - Moon 1", "position" => { "x" => 58_605_102_008, "y" => -3_066_616_285, "z" => -55_193_617_920 }, "system_id" => 30_000_003 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/moons/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_moon(moon_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/moons/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_moon(moon_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/moons/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_moon(moon_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/moons/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_moon(moon_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/moons/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_moon(moon_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_planet" do
    context "when the response is 200" do
      let(:response) { { "name" => "Akpivem III", "planet_id" => 40_000_046, "position" => { "x" => -189_226_344_497, "y" => 9_901_605_317, "z" => -254_852_632_979 }, "system_id" => 30_000_003, "type_id" => 13 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/planets/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_planet(planet_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/planets/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_planet(planet_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/planets/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_planet(planet_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/planets/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_planet(planet_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/planets/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_planet(planet_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_races" do
    context "when the response is 200" do
      let(:response) { [{ "alliance_id" => 500_001, "description" => "Founded on the tenets of patriotism and hard work...", "name" => "Caldari", "race_id" => 1 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/races/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_races).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/races/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_races }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/races/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_races }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/races/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_races }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_region" do
    context "when the response is 200" do
      let(:response) { { "constellations" => [20_000_302, 20_000_303], "description" => "It has long been an established fact of civilization...", "name" => "Metropolis", "region_id" => 10_000_042 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_region(region_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_region(region_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_region(region_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_region(region_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_region(region_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_regions" do
    context "when the response is 200" do
      let(:response) { [11_000_001, 11_000_002] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_regions).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_regions }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_regions }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/regions/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_regions }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_star" do
    context "when the response is 200" do
      let(:response) { { "age" => 9_398_686_722, "luminosity" => 0.06615000218153, "name" => "BKG-Q2 - Star", "radius" => 346_600_000, "solar_system_id" => 30_004_333, "spectral_class" => "K2 V", "temperature" => 3953, "type_id" => 45_033 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stars/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_star(star_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stars/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_star(star_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stars/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_star(star_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stars/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_star(star_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_stargate" do
    context "when the response is 200" do
      let(:response) { { "destination" => { "stargate_id" => 50_000_056, "system_id" => 30_000_001 }, "name" => "Stargate (Tanoo)", "position" => { "x" => -101_092_761_600, "y" => 5_279_539_200, "z" => 1_550_503_403_520 }, "stargate_id" => 50_000_342, "system_id" => 30_000_003, "type_id" => 29_624 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stargates/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_stargate(stargate_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stargates/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_stargate(stargate_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stargates/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_stargate(stargate_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stargates/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_stargate(stargate_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stargates/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_stargate(stargate_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_station" do
    context "when the response is 200" do
      let(:response) { { "max_dockable_ship_volume" => 50_000_000, "name" => "Jakanerva III - Moon 15 - Prompt Delivery Storage", "office_rental_cost" => 10_000, "owner" => 1_000_003, "position" => { "x" => 165_632_286_720, "y" => 2_771_804_160, "z" => -2_455_331_266_560 }, "race_id" => 1, "reprocessing_efficiency" => 0.5, "reprocessing_stations_take" => 0.05, "services" => %w[courier-missions reprocessing-plant market repair-facilities fitting news storage insurance docking office-rental loyalty-point-store navy-offices], "station_id" => 60_000_277, "system_id" => 30_000_148, "type_id" => 1531 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stations/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_station(station_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stations/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_station(station_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stations/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_station(station_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stations/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_station(station_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/stations/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_station(station_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_structure" do
    context "when the response is 200" do
      let(:response) { { "name" => "V-3YG7 VI - The Capital", "owner_id" => 109_299_958, "solar_system_id" => 30_000_142 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_structure(structure_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_structure(structure_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/1234567890/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_universe_structure(structure_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_universe_structure(structure_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_structure(structure_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_structure(structure_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_structure(structure_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_structures" do
    context "when the response is 200" do
      let(:response) { [1_020_988_381_992, 1_020_988_381_991] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/").with(query: { filter: "1234567890" }).to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_structures(filter: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/").with(query: { filter: "1234567890" }).to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_structures(filter: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/").with(query: { filter: "1234567890" }).to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_structures(filter: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/structures/").with(query: { filter: "1234567890" }).to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_structures(filter: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_system" do
    context "when the response is 200" do
      let(:response) { { "constellation_id" => 20_000_001, "name" => "Akpivem", "planets" => [{ "moons" => [40_000_042], "planet_id" => 40_000_041 }, { "planet_id" => 40_000_043 }], "position" => { "x" => -91_174_141_133_075_340, "y" => 43_938_227_486_247_170, "z" => -56_482_824_383_339_900 }, "security_class" => "B", "security_status" => 0.8462923765182495, "star_id" => 40_000_040, "stargates" => [50_000_342], "system_id" => 30_000_003 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_system(system_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_system(system_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_system(system_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_system(system_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_system(system_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_system_jumps" do
    context "when the response is 200" do
      let(:response) { [{ "ship_jumps" => 42, "system_id" => 30_002_410 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/system_jumps/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_system_jumps).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/system_jumps/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_system_jumps }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/system_jumps/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_system_jumps }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/system_jumps/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_system_jumps }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_system_kills" do
    context "when the response is 200" do
      let(:response) { [{ "npc_kills" => 0, "pod_kills" => 24, "ship_kills" => 42, "system_id" => 30_002_410 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/system_kills/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_system_kills).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/system_kills/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_system_kills }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/system_kills/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_system_kills }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/system_kills/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_system_kills }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_systems" do
    context "when the response is 200" do
      let(:response) { [30_000_001, 30_000_002] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_systems).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_systems }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_systems }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/systems/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_systems }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_type" do
    context "when the response is 200" do
      let(:response) { { "description" => "The Rifter is a...", "group_id" => 25, "name" => "Rifter", "published" => true, "type_id" => 587 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_type(type_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_type(type_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_universe_type(type_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_type(type_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_type(type_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#get_universe_types" do
    context "when the response is 200" do
      let(:response) { [1, 2, 3] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_universe_types).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_universe_types }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_universe_types }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/universe/types/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_universe_types }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_universe_ids" do
    context "when the response is 200" do
      let(:response) { { "characters" => [{ "id" => 95_465_499, "name" => "CCP Bartender" }, { "id" => 2_112_625_428, "name" => "CCP Zoetrope" }], "systems" => [{ "id" => 30_000_142, "name" => "Jita" }] } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/ids/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.post_universe_ids(names: [1, 2, 3])).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/ids/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_universe_ids(names: [1, 2, 3]) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/ids/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_universe_ids(names: [1, 2, 3]) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/ids/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_universe_ids(names: [1, 2, 3]) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_universe_names" do
    context "when the response is 200" do
      let(:response) { [{ "category" => "character", "id" => 95_465_499, "name" => "CCP Bartender" }, { "category" => "solar_system", "id" => 30_000_142, "name" => "Jita" }] }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/names/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.post_universe_names(ids: [1, 2, 3])).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/names/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_universe_names(ids: [1, 2, 3]) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/names/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.post_universe_names(ids: [1, 2, 3]) }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/names/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_universe_names(ids: [1, 2, 3]) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/universe/names/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_universe_names(ids: [1, 2, 3]) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
