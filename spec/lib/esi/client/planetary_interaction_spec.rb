# frozen_string_literal: true

RSpec.describe ESI::Client::PlanetaryInteraction, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_planet' do
    context 'when the response is 200' do
      let(:response) { { 'links' => [{ 'destination_pin_id' => 1_000_000_017_022, 'link_level' => 0, 'source_pin_id' => 1_000_000_017_021 }], 'pins' => [{ 'latitude' => 1.55087844973, 'longitude' => 0.717145933308, 'pin_id' => 1_000_000_017_021, 'type_id' => 2254 }, { 'latitude' => 1.53360639935, 'longitude' => 0.709775584394, 'pin_id' => 1_000_000_017_022, 'type_id' => 2256 }], 'routes' => [{ 'content_type_id' => 2393, 'destination_pin_id' => 1_000_000_017_030, 'quantity' => 20, 'route_id' => 4, 'source_pin_id' => 1_000_000_017_029 }] } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/planets/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_planet(character_id: '1234567890', planet_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_planets' do
    context 'when the response is 200' do
      let(:response) { [{ 'last_update' => '2016-11-28T16:42:51Z', 'num_pins' => 1, 'owner_id' => 90_000_001, 'planet_id' => 40_023_691, 'planet_type' => 'plasma', 'solar_system_id' => 30_000_379, 'upgrade_level' => 0 }, { 'last_update' => '2016-11-28T16:41:54Z', 'num_pins' => 1, 'owner_id' => 90_000_001, 'planet_id' => 40_023_697, 'planet_type' => 'barren', 'solar_system_id' => 30_000_379, 'upgrade_level' => 0 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/planets/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_planets(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_customs_offices' do
    context 'when the response is 200' do
      let(:response) { [{ 'alliance_tax_rate' => 0.1, 'allow_access_with_standings' => true, 'allow_alliance_access' => false, 'corporation_tax_rate' => 0.02, 'excellent_standing_tax_rate' => 0.05, 'good_standing_tax_rate' => 0.2, 'neutral_standing_tax_rate' => 0.5, 'office_id' => 1_000_000_014_530, 'reinforce_exit_end' => 1, 'reinforce_exit_start' => 23, 'standing_level' => 'neutral', 'system_id' => 30_003_657 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/customs_offices/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_corporation_customs_offices(corporation_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_universe_schematic' do
    context 'when the response is 200' do
      let(:response) { { 'cycle_time' => 1800, 'schematic_name' => 'Bacteria' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/universe/schematics/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_universe_schematic(schematic_id: '1234567890')).to eq(response)
      end
    end
  end
end
