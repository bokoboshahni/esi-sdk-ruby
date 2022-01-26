# frozen_string_literal: true

RSpec.describe ESI::Client::Sovereignty, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_sovereignty_campaigns' do
    context 'when the response is 200' do
      let(:response) { [{ 'attackers_score' => 0.4, 'campaign_id' => 32_833, 'constellation_id' => 20_000_125, 'defender_id' => 1_695_357_456, 'defender_score' => 0.6, 'event_type' => 'station_defense', 'solar_system_id' => 30_000_856, 'start_time' => '2016-10-29T14:34:40Z', 'structure_id' => 61_001_096 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/sovereignty/campaigns/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_sovereignty_campaigns).to eq(response)
      end
    end
  end

  describe '#get_sovereignty_map' do
    context 'when the response is 200' do
      let(:response) { [{ 'faction_id' => 500_001, 'system_id' => 30_045_334 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/sovereignty/map/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_sovereignty_map).to eq(response)
      end
    end
  end

  describe '#get_sovereignty_structures' do
    context 'when the response is 200' do
      let(:response) { [{ 'alliance_id' => 498_125_261, 'solar_system_id' => 30_000_570, 'structure_id' => 1_018_253_388_776, 'structure_type_id' => 32_226, 'vulnerability_occupancy_level' => 2, 'vulnerable_end_time' => '2016-10-29T05:30:00Z', 'vulnerable_start_time' => '2016-10-28T20:30:00Z' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/sovereignty/structures/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_sovereignty_structures).to eq(response)
      end
    end
  end
end
