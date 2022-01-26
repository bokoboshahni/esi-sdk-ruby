# frozen_string_literal: true

RSpec.describe ESI::Client::Calendar, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_calendar' do
    context 'when the response is 200' do
      let(:response) { [{ 'event_date' => '2016-06-26T20:00:00Z', 'event_id' => 1_386_435, 'event_response' => 'accepted', 'importance' => 0, 'title' => 'o7 The EVE Online Show' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/calendar/').with(query: { from_event: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_calendar(character_id: '1234567890', from_event: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_calendar_event' do
    context 'when the response is 200' do
      let(:response) { { 'date' => '2016-06-26T21:00:00Z', 'duration' => 60, 'event_id' => 1_386_435, 'importance' => 1, 'owner_id' => 1, 'owner_name' => 'EVE System', 'owner_type' => 'eve_server', 'response' => 'Undecided', 'text' => "o7: The EVE Online Show features latest developer news, fast paced action, community overviews and a lot more with CCP Guard and CCP Mimic. Join the thrilling o7 live broadcast at 20:00 EVE time (=UTC) on <a href=\"http://www.twitch.tv/ccp\">EVE TV</a>. Don't miss it!", 'title' => 'o7 The EVE Online Show' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_calendar_event(character_id: '1234567890', event_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_calendar_event_attendees' do
    context 'when the response is 200' do
      let(:response) { [{ 'character_id' => 2_112_625_428, 'event_response' => 'accepted' }, { 'character_id' => 95_465_499, 'event_response' => 'tentative' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_calendar_event_attendees(character_id: '1234567890', event_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#put_character_calendar_event' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:put, 'https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.put_character_calendar_event(character_id: '1234567890', event_id: '1234567890', response: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end
end
