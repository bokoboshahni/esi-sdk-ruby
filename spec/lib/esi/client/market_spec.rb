# frozen_string_literal: true

RSpec.describe ESI::Client::Market, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_orders' do
    context 'when the response is 200' do
      let(:response) { [{ 'duration' => 30, 'escrow' => 45.6, 'is_buy_order' => true, 'is_corporation' => false, 'issued' => '2016-09-03T05:12:25Z', 'location_id' => 456, 'min_volume' => 1, 'order_id' => 123, 'price' => 33.3, 'range' => 'station', 'region_id' => 123, 'type_id' => 456, 'volume_remain' => 4422, 'volume_total' => 123_456 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/orders/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_orders(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_orders_history' do
    context 'when the response is 200' do
      let(:response) { [{ 'duration' => 30, 'escrow' => 45.6, 'is_buy_order' => true, 'is_corporation' => false, 'issued' => '2016-09-03T05:12:25Z', 'location_id' => 456, 'min_volume' => 1, 'order_id' => 123, 'price' => 33.3, 'range' => 'station', 'region_id' => 123, 'state' => 'expired', 'type_id' => 456, 'volume_remain' => 4422, 'volume_total' => 123_456 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/orders/history/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_character_orders_history(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_orders' do
    context 'when the response is 200' do
      let(:response) { [{ 'duration' => 30, 'escrow' => 45.6, 'is_buy_order' => true, 'issued' => '2016-09-03T05:12:25Z', 'issued_by' => 2_112_625_428, 'location_id' => 456, 'min_volume' => 1, 'order_id' => 123, 'price' => 33.3, 'range' => 'station', 'region_id' => 123, 'type_id' => 456, 'volume_remain' => 4422, 'volume_total' => 123_456, 'wallet_division' => 1 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/orders/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_corporation_orders(corporation_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_orders_history' do
    context 'when the response is 200' do
      let(:response) { [{ 'duration' => 30, 'escrow' => 45.6, 'is_buy_order' => true, 'issued' => '2016-09-03T05:12:25Z', 'issued_by' => 2_112_625_428, 'location_id' => 456, 'min_volume' => 1, 'order_id' => 123, 'price' => 33.3, 'range' => 'station', 'region_id' => 123, 'state' => 'expired', 'type_id' => 456, 'volume_remain' => 4422, 'volume_total' => 123_456, 'wallet_division' => 1 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/orders/history/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_corporation_orders_history(corporation_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_market_groups' do
    context 'when the response is 200' do
      let(:response) { [1, 2, 3] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/groups/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_market_groups).to eq(response)
      end
    end
  end

  describe '#get_market_groups_market_group' do
    context 'when the response is 200' do
      let(:response) { { 'description' => 'Small, fast vessels suited to a variety of purposes.', 'market_group_id' => 5, 'name' => 'Standard Frigates', 'parent_group_id' => 1361, 'types' => [582, 583] } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/groups/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_market_groups_market_group(market_group_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_market_prices' do
    context 'when the response is 200' do
      let(:response) { [{ 'adjusted_price' => 306_988.09, 'average_price' => 306_292.67, 'type_id' => 32_772 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/prices/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_market_prices).to eq(response)
      end
    end
  end

  describe '#get_markets_region_history' do
    context 'when the response is 200' do
      let(:response) { [{ 'average' => 5.25, 'date' => '2015-05-01', 'highest' => 5.27, 'lowest' => 5.11, 'order_count' => 2267, 'volume' => 16_276_782_035 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/history/').with(query: { type_id: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_markets_region_history(region_id: '1234567890', type_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_markets_region_orders' do
    context 'when the response is 200' do
      let(:response) { [{ 'duration' => 90, 'is_buy_order' => false, 'issued' => '2016-09-03T05:12:25Z', 'location_id' => 60_005_599, 'min_volume' => 1, 'order_id' => 4_623_824_223, 'price' => 9.9, 'range' => 'region', 'system_id' => 30_000_053, 'type_id' => 34, 'volume_remain' => 1_296_000, 'volume_total' => 2_000_000 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_markets_region_orders(region_id: '1234567890', order_type: '1234567890', type_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_markets_region_types' do
    context 'when the response is 200' do
      let(:response) { [587, 593, 597] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/types/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_markets_region_types(region_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_markets_structure' do
    context 'when the response is 200' do
      let(:response) { [{ 'duration' => 90, 'is_buy_order' => false, 'issued' => '2016-09-03T05:12:25Z', 'location_id' => 1_020_988_381_992, 'min_volume' => 1, 'order_id' => 4_623_824_223, 'price' => 9.9, 'range' => 'region', 'type_id' => 34, 'volume_remain' => 1_296_000, 'volume_total' => 2_000_000 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/structures/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_markets_structure(structure_id: '1234567890')).to eq(response)
      end
    end
  end
end
