# frozen_string_literal: true

RSpec.describe ESI::Client::Character, type: :integration do
  subject(:client) { ESI::Client.new(user_agent: "ESI SDK Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk)") }

  describe "#get_character" do
    it "returns the character" do
      response = client.get_character(character_id: "2113024536")
      expect(response["name"]).to eq("Bokobo Shahni")
    end
  end

  describe "#post_character_affiliation" do
    it "returns the character's affiliations" do
      response = client.post_characters_affiliation(characters: [2_113_024_536])
      expect(response).to include("alliance_id" => 99_010_079, "character_id" => 2_113_024_536,
                                  "corporation_id" => 98_613_799)
    end
  end
end
