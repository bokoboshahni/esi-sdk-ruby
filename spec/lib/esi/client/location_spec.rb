# frozen_string_literal: true

RSpec.describe ESI::Client::Location, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_location' do
    context 'when the response is 200' do
      let(:response) { { 'solar_system_id' => 30_002_505, 'structure_id' => 1_000_000_016_989 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/location/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_location(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_online' do
    context 'when the response is 200' do
      let(:response) { { 'last_login' => '2017-01-02T03:04:05Z', 'last_logout' => '2017-01-02T04:05:06Z', 'logins' => 9001, 'online' => true } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/online/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_online(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_ship' do
    context 'when the response is 200' do
      let(:response) { { 'ship_item_id' => 1_000_000_016_991, 'ship_name' => 'SPACESHIPS!!!', 'ship_type_id' => 1233 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/ship/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_ship(character_id: '1234567890')).to eq(response)
      end
    end
  end
end
