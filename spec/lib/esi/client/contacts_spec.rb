# frozen_string_literal: true

RSpec.describe ESI::Client::Contact, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#delete_character_contacts' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:delete, 'https://esi.evetech.net/latest/characters/1234567890/contacts/').with(query: { contact_ids: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.delete_character_contacts(character_id: '1234567890', contact_ids: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_alliance_contact_labels' do
    context 'when the response is 200' do
      let(:response) { [{ 'label_id' => 1, 'label_name' => 'Alliance Friends' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/alliances/1234567890/contacts/labels/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_alliance_contact_labels(alliance_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_alliance_contacts' do
    context 'when the response is 200' do
      let(:response) { [{ 'contact_id' => 2_112_625_428, 'contact_type' => 'character', 'standing' => 9.9 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/alliances/1234567890/contacts/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_alliance_contacts(alliance_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_contact_labels' do
    context 'when the response is 200' do
      let(:response) { [{ 'label_id' => 123, 'label_name' => 'Friends' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/contacts/labels/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_contact_labels(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_contacts' do
    context 'when the response is 200' do
      let(:response) { [{ 'contact_id' => 123, 'contact_type' => 'character', 'is_blocked' => true, 'is_watched' => true, 'standing' => 9.9 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/contacts/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_character_contacts(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_contact_labels' do
    context 'when the response is 200' do
      let(:response) { [{ 'label_id' => 2, 'label_name' => 'Corporation Friends' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/contacts/labels/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_corporation_contact_labels(corporation_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_contacts' do
    context 'when the response is 200' do
      let(:response) { [{ 'contact_id' => 123, 'contact_type' => 'character', 'is_watched' => true, 'standing' => 9.9 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/contacts/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_corporation_contacts(corporation_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#post_character_contacts' do
    context 'when the response is 201' do
      let(:response) { [123, 456] }

      before do
        stub_request(:post, 'https://esi.evetech.net/latest/characters/1234567890/contacts/').with(query: { label_ids: '1234567890', standing: '1234567890', watched: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.post_character_contacts(character_id: '1234567890', label_ids: '1234567890', standing: '1234567890', watched: '1234567890', contact_ids: [1, 2, 3])).to eq(response)
      end
    end
  end

  describe '#put_character_contacts' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:put, 'https://esi.evetech.net/latest/characters/1234567890/contacts/').with(query: { label_ids: '1234567890', standing: '1234567890', watched: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.put_character_contacts(character_id: '1234567890', label_ids: '1234567890', standing: '1234567890', watched: '1234567890', contact_ids: [1, 2, 3])).to eq(response)
      end
    end
  end
end
