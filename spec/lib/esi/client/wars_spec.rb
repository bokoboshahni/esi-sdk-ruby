# frozen_string_literal: true

RSpec.describe ESI::Client::War, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_war' do
    context 'when the response is 200' do
      let(:response) { { 'aggressor' => { 'corporation_id' => 986_665_792, 'isk_destroyed' => 0, 'ships_killed' => 0 }, 'declared' => '2004-05-22T05:20:00Z', 'defender' => { 'corporation_id' => 1_001_562_011, 'isk_destroyed' => 0, 'ships_killed' => 0 }, 'id' => 1941, 'mutual' => false, 'open_for_allies' => false } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/wars/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_war(war_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_war_killmails' do
    context 'when the response is 200' do
      let(:response) { [{ 'killmail_hash' => '8eef5e8fb6b88fe3407c489df33822b2e3b57a5e', 'killmail_id' => 2 }, { 'killmail_hash' => 'b41ccb498ece33d64019f64c0db392aa3aa701fb', 'killmail_id' => 1 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/wars/1234567890/killmails/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_war_killmails(war_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_wars' do
    context 'when the response is 200' do
      let(:response) { [3, 2, 1] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/wars/').with(query: { max_war_id: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_wars(max_war_id: '1234567890')).to eq(response)
      end
    end
  end
end
