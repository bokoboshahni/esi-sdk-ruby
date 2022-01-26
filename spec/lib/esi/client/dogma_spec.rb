# frozen_string_literal: true

RSpec.describe ESI::Client::Dogma, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_dogma_attribute' do
    context 'when the response is 200' do
      let(:response) { { 'attribute_id' => 20, 'default_value' => 1, 'description' => 'Factor by which topspeed increases.', 'display_name' => 'Maximum Velocity Bonus', 'high_is_good' => true, 'icon_id' => 1389, 'name' => 'speedFactor', 'published' => true, 'unit_id' => 124 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/dogma/attributes/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_dogma_attribute(attribute_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_dogma_attributes' do
    context 'when the response is 200' do
      let(:response) { [1, 2, 3] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/dogma/attributes/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_dogma_attributes).to eq(response)
      end
    end
  end

  describe '#get_dogma_dynamic_items_type_item' do
    context 'when the response is 200' do
      let(:response) { { 'created_by' => 2_112_625_428, 'dogma_attributes' => [{ 'attribute_id' => 9, 'value' => 350 }], 'dogma_effects' => [{ 'effect_id' => 508, 'is_default' => false }], 'mutator_type_id' => 47_845, 'source_type_id' => 33_103 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/dogma/dynamic/items/1234567890/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_dogma_dynamic_items_type_item(item_id: '1234567890', type_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_dogma_effect' do
    context 'when the response is 200' do
      let(:response) { { 'description' => 'Requires a high power slot.', 'display_name' => 'High power', 'effect_category' => 0, 'effect_id' => 12, 'icon_id' => 293, 'name' => 'hiPower', 'post_expression' => 131, 'pre_expression' => 131, 'published' => true } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/dogma/effects/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_dogma_effect(effect_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_dogma_effects' do
    context 'when the response is 200' do
      let(:response) { [1, 2, 3] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/dogma/effects/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_dogma_effects).to eq(response)
      end
    end
  end
end
