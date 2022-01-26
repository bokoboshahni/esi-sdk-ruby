# frozen_string_literal: true

RSpec.describe ESI::Client::Clone, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_clones' do
    context 'when the response is 200' do
      let(:response) { { 'home_location' => { 'location_id' => 1_021_348_135_816, 'location_type' => 'structure' }, 'jump_clones' => [{ 'implants' => [22_118], 'jump_clone_id' => 12_345, 'location_id' => 60_003_463, 'location_type' => 'station' }] } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/clones/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_clones(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_implants' do
    context 'when the response is 200' do
      let(:response) { [1, 2, 3] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/implants/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_implants(character_id: '1234567890')).to eq(response)
      end
    end
  end
end
