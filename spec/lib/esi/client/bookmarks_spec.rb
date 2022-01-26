# frozen_string_literal: true

RSpec.describe ESI::Client::Bookmark, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_bookmark_folders' do
    context 'when the response is 200' do
      let(:response) { [{ 'folder_id' => 5, 'name' => 'Icecream' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/bookmarks/folders/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_character_bookmark_folders(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_bookmarks' do
    context 'when the response is 200' do
      let(:response) { [{ 'bookmark_id' => 4, 'created' => '2016-08-09T11:57:47Z', 'creator_id' => 2_112_625_428, 'folder_id' => 5, 'item' => { 'item_id' => 50_006_722, 'type_id' => 29_633 }, 'label' => 'Stargate', 'location_id' => 30_003_430, 'notes' => 'This is a stargate' }, { 'bookmark_id' => 5, 'coordinates' => { 'x' => -2_958_928_814_000, 'y' => -338_367_275_823, 'z' => 2_114_538_075_090 }, 'created' => '2016-08-09T11:57:47Z', 'creator_id' => 2_112_625_428, 'folder_id' => 5, 'label' => 'Random location', 'location_id' => 30_003_430, 'notes' => 'This is a random location in space' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/bookmarks/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_character_bookmarks(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_bookmark_folders' do
    context 'when the response is 200' do
      let(:response) { [{ 'folder_id' => 5, 'name' => 'Important Locations' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/bookmarks/folders/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_corporation_bookmark_folders(corporation_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_bookmarks' do
    context 'when the response is 200' do
      let(:response) { [{ 'bookmark_id' => 4, 'created' => '2016-08-09T11:57:47Z', 'creator_id' => 2_112_625_428, 'folder_id' => 5, 'item' => { 'item_id' => 50_006_722, 'type_id' => 29_633 }, 'label' => 'Stargate', 'location_id' => 30_003_430, 'notes' => 'This is a stargate' }, { 'bookmark_id' => 5, 'coordinates' => { 'x' => -2_958_928_814_000, 'y' => -338_367_275_823, 'z' => 2_114_538_075_090 }, 'created' => '2016-08-09T11:57:47Z', 'creator_id' => 2_112_625_428, 'folder_id' => 5, 'label' => 'Random location', 'location_id' => 30_003_430, 'notes' => 'This is a random location in space' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/bookmarks/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_corporation_bookmarks(corporation_id: '1234567890')).to eq(response)
      end
    end
  end
end
