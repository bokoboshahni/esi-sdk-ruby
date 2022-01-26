# frozen_string_literal: true

RSpec.describe ESI::Client::Loyalty, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_loyalty_points' do
    context 'when the response is 200' do
      let(:response) { [{ 'corporation_id' => 123, 'loyalty_points' => 100 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/loyalty/points/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_loyalty_points(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_loyalty_stores_corporation_offers' do
    context 'when the response is 200' do
      let(:response) { [{ 'ak_cost' => 35_000, 'isk_cost' => 0, 'lp_cost' => 100, 'offer_id' => 1, 'quantity' => 1, 'required_items' => [], 'type_id' => 123 }, { 'isk_cost' => 1000, 'lp_cost' => 100, 'offer_id' => 2, 'quantity' => 10, 'required_items' => [{ 'quantity' => 10, 'type_id' => 1234 }], 'type_id' => 1235 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/loyalty/stores/1234567890/offers/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_loyalty_stores_corporation_offers(corporation_id: '1234567890')).to eq(response)
      end
    end
  end
end
