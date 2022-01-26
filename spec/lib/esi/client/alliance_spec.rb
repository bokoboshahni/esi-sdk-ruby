# frozen_string_literal: true

RSpec.describe ESI::Client::Alliance, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_alliance' do
    context 'when the response is 200' do
      let(:response) { { 'creator_corporation_id' => 45_678, 'creator_id' => 12_345, 'date_founded' => '2016-06-26T21:00:00Z', 'executor_corporation_id' => 98_356_193, 'name' => 'C C P Alliance', 'ticker' => '<C C P>' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/alliances/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_alliance(alliance_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_alliance_corporations' do
    context 'when the response is 200' do
      let(:response) { [98_000_001] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/alliances/1234567890/corporations/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_alliance_corporations(alliance_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_alliance_icons' do
    context 'when the response is 200' do
      let(:response) { { 'px128x128' => 'https://images.evetech.net/Alliance/503818424_128.png', 'px64x64' => 'https://images.evetech.net/Alliance/503818424_64.png' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/alliances/1234567890/icons/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_alliance_icons(alliance_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_alliances' do
    context 'when the response is 200' do
      let(:response) { [99_000_001, 99_000_002] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/alliances/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_alliances).to eq(response)
      end
    end
  end
end
