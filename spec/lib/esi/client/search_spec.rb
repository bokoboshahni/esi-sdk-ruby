# frozen_string_literal: true

RSpec.describe ESI::Client::Search, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_search' do
    context 'when the response is 200' do
      let(:response) { { 'solar_system' => [30_002_510], 'station' => [60_004_588, 60_004_594, 60_005_725, 60_009_106, 60_012_721, 60_012_724, 60_012_727] } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/search/').with(query: { categories: '1234567890', search: '1234567890', strict: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_search(character_id: '1234567890', categories: '1234567890', search: '1234567890', strict: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_search' do
    context 'when the response is 200' do
      let(:response) { { 'solar_system' => [30_002_510], 'station' => [60_004_588, 60_004_594, 60_005_725, 60_009_106, 60_012_721, 60_012_724, 60_012_727] } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/search/').with(query: { categories: '1234567890', search: '1234567890', strict: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_search(categories: '1234567890', search: '1234567890', strict: '1234567890')).to eq(response)
      end
    end
  end
end
