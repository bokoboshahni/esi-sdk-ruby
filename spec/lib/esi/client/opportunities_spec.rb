# frozen_string_literal: true

RSpec.describe ESI::Client::Opportunity, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_opportunities' do
    context 'when the response is 200' do
      let(:response) { [{ 'completed_at' => '2016-04-29T12:34:56Z', 'task_id' => 1 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/opportunities/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_opportunities(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_opportunities_group' do
    context 'when the response is 200' do
      let(:response) { { 'connected_groups' => [100], 'description' => 'As a capsuleer...', 'group_id' => 103, 'name' => 'Welcome to New Eden', 'notification' => 'Completed:<br>Welcome to New Eden', 'required_tasks' => [19] } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/opportunities/groups/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_opportunities_group(group_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_opportunities_task' do
    context 'when the response is 200' do
      let(:response) { { 'description' => 'To use station services...', 'name' => 'Dock in the station', 'notification' => 'Completed:<br>Docked in a station!', 'task_id' => 10 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/opportunities/tasks/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_opportunities_task(task_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_opportunity_groups' do
    context 'when the response is 200' do
      let(:response) { [100, 101, 102, 103] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/opportunities/groups/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_opportunity_groups).to eq(response)
      end
    end
  end

  describe '#get_opportunity_tasks' do
    context 'when the response is 200' do
      let(:response) { [1, 2, 3, 4] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/opportunities/tasks/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_opportunity_tasks).to eq(response)
      end
    end
  end
end
