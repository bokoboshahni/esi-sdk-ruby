# frozen_string_literal: true

RSpec.describe ESI::Client::Skill, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_attributes' do
    context 'when the response is 200' do
      let(:response) { { 'charisma' => 20, 'intelligence' => 20, 'memory' => 20, 'perception' => 20, 'willpower' => 20 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/attributes/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_attributes(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_skillqueue' do
    context 'when the response is 200' do
      let(:response) { [{ 'finish_date' => '2016-06-29T10:47:00Z', 'finished_level' => 3, 'queue_position' => 0, 'skill_id' => 1, 'start_date' => '2016-06-29T10:46:00Z' }, { 'finish_date' => '2016-07-15T10:47:00Z', 'finished_level' => 4, 'queue_position' => 1, 'skill_id' => 1, 'start_date' => '2016-06-29T10:47:00Z' }, { 'finish_date' => '2016-08-30T10:47:00Z', 'finished_level' => 2, 'queue_position' => 2, 'skill_id' => 2, 'start_date' => '2016-07-15T10:47:00Z' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/skillqueue/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_skillqueue(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_skills' do
    context 'when the response is 200' do
      let(:response) { { 'skills' => [{ 'active_skill_level' => 3, 'skill_id' => 1, 'skillpoints_in_skill' => 10_000, 'trained_skill_level' => 4 }, { 'active_skill_level' => 1, 'skill_id' => 2, 'skillpoints_in_skill' => 10_000, 'trained_skill_level' => 1 }], 'total_sp' => 20_000 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/skills/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_skills(character_id: '1234567890')).to eq(response)
      end
    end
  end
end
