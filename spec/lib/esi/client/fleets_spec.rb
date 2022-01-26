# frozen_string_literal: true

RSpec.describe ESI::Client::Fleet, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#delete_fleet_member' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:delete, 'https://esi.evetech.net/latest/fleets/1234567890/members/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.delete_fleet_member(fleet_id: '1234567890', member_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#delete_fleet_squad' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:delete, 'https://esi.evetech.net/latest/fleets/1234567890/squads/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.delete_fleet_squad(fleet_id: '1234567890', squad_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#delete_fleet_wing' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:delete, 'https://esi.evetech.net/latest/fleets/1234567890/wings/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.delete_fleet_wing(fleet_id: '1234567890', wing_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_fleet' do
    context 'when the response is 200' do
      let(:response) { { 'fleet_id' => 1_234_567_890, 'role' => 'fleet_commander', 'squad_id' => -1, 'wing_id' => -1 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/fleet/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_fleet(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_fleet' do
    context 'when the response is 200' do
      let(:response) { { 'is_free_move' => false, 'is_registered' => false, 'is_voice_enabled' => false, 'motd' => 'This is an <b>awesome</b> fleet!' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/fleets/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_fleet(fleet_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_fleet_members' do
    context 'when the response is 200' do
      let(:response) { [{ 'character_id' => 93_265_215, 'join_time' => '2016-04-29T12:34:56Z', 'role' => 'squad_commander', 'role_name' => 'Squad Commander (Boss)', 'ship_type_id' => 33_328, 'solar_system_id' => 30_003_729, 'squad_id' => 3_129_411_261_968, 'station_id' => 61_000_180, 'takes_fleet_warp' => true, 'wing_id' => 2_073_711_261_968 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/fleets/1234567890/members/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_fleet_members(fleet_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_fleet_wings' do
    context 'when the response is 200' do
      let(:response) { [{ 'id' => 2_073_711_261_968, 'name' => 'Wing 1', 'squads' => [{ 'id' => 3_129_411_261_968, 'name' => 'Squad 1' }] }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/fleets/1234567890/wings/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_fleet_wings(fleet_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#post_fleet_members' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:post, 'https://esi.evetech.net/latest/fleets/1234567890/members/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.post_fleet_members(fleet_id: '1234567890', invitation: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end

  describe '#post_fleet_wing_squads' do
    context 'when the response is 201' do
      let(:response) { { 'squad_id' => 123 } }

      before do
        stub_request(:post, 'https://esi.evetech.net/latest/fleets/1234567890/wings/1234567890/squads/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.post_fleet_wing_squads(fleet_id: '1234567890', wing_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#post_fleet_wings' do
    context 'when the response is 201' do
      let(:response) { { 'wing_id' => 123 } }

      before do
        stub_request(:post, 'https://esi.evetech.net/latest/fleets/1234567890/wings/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.post_fleet_wings(fleet_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#put_fleet' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:put, 'https://esi.evetech.net/latest/fleets/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.put_fleet(fleet_id: '1234567890', new_settings: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end

  describe '#put_fleet_member' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:put, 'https://esi.evetech.net/latest/fleets/1234567890/members/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.put_fleet_member(fleet_id: '1234567890', member_id: '1234567890', movement: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end

  describe '#put_fleet_squad' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:put, 'https://esi.evetech.net/latest/fleets/1234567890/squads/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.put_fleet_squad(fleet_id: '1234567890', squad_id: '1234567890', naming: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end

  describe '#put_fleet_wing' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:put, 'https://esi.evetech.net/latest/fleets/1234567890/wings/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.put_fleet_wing(fleet_id: '1234567890', wing_id: '1234567890', naming: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end
end
