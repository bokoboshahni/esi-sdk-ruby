# frozen_string_literal: true

RSpec.describe ESI::Client::Fitting, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#delete_character_fitting' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:delete, 'https://esi.evetech.net/latest/characters/1234567890/fittings/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.delete_character_fitting(character_id: '1234567890', fitting_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_fittings' do
    context 'when the response is 200' do
      let(:response) { [{ 'description' => 'Awesome Vindi fitting', 'fitting_id' => 1, 'items' => [{ 'flag' => 'Cargo', 'quantity' => 1, 'type_id' => 1234 }], 'name' => 'Best Vindicator', 'ship_type_id' => 123 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/fittings/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_fittings(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#post_character_fittings' do
    context 'when the response is 201' do
      let(:response) { { 'fitting_id' => 2 } }

      before do
        stub_request(:post, 'https://esi.evetech.net/latest/characters/1234567890/fittings/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.post_character_fittings(character_id: '1234567890', fitting: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end
end
