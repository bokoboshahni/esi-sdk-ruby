# frozen_string_literal: true

RSpec.describe ESI::Client do
  subject(:client) { ESI::Client.new(user_agent: user_agent, retries: 2) }

  let(:user_agent) { 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)' }

  it 'can be instantiated' do
    expect(client).to be_a(ESI::Client)
  end

  describe 'error handling without pagination' do
    context 'when the response is 400' do
      let(:response) { { 'error' => 'Bad request message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/agents_research/').to_return(
          body: response.to_json, status: 400, headers: { 'Content-Type': 'application/json' }
        )
      end

      it 'raises a ESI::Errors::BadRequestError error' do
        expect do
          client.get_character_agents_research(character_id: '1234567890')
        end.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context 'when the response is 401' do
      let(:response) { { 'error' => 'Unauthorized message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/agents_research/').to_return(
          body: response.to_json, status: 401, headers: { 'Content-Type': 'application/json' }
        )
      end

      it 'raises a ESI::Errors::UnauthorizedError error' do
        expect do
          client.get_character_agents_research(character_id: '1234567890')
        end.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context 'when the response is 403' do
      let(:response) { { 'error' => 'Forbidden message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/agents_research/').to_return(
          body: response.to_json, status: 403, headers: { 'Content-Type': 'application/json' }
        )
      end

      it 'raises a ESI::Errors::ForbiddenError error' do
        expect do
          client.get_character_agents_research(character_id: '1234567890')
        end.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context 'when the response is 420' do
      let(:response) { { 'error' => 'Error limited message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/agents_research/').to_return(
          body: response.to_json, status: 420, headers: { 'Content-Type': 'application/json' }
        )
      end

      it 'raises a ESI::Errors::ErrorLimitedError error' do
        expect do
          client.get_character_agents_research(character_id: '1234567890')
        end.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context 'when the response is 500' do
      let(:response) { { 'error' => 'Internal server error message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/agents_research/').to_return(
          body: response.to_json, status: 500, headers: { 'Content-Type': 'application/json' }
        )
      end

      it 'raises a ESI::Errors::InternalServerError error' do
        expect do
          client.get_character_agents_research(character_id: '1234567890')
        end.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe 'error handling with pagination' do
    let(:response) do
      [{ 'duration' => 90, 'is_buy_order' => false, 'issued' => '2016-09-03T05:12:25Z', 'location_id' => 60_005_599,
         'min_volume' => 1, 'order_id' => 4_623_824_223, 'price' => 9.9, 'range' => 'region', 'system_id' => 30_000_053, 'type_id' => 34, 'volume_remain' => 1_296_000, 'volume_total' => 2_000_000 }]
    end

    context 'when the response is 400' do
      let(:error_response) { { 'error' => 'Bad request message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: response.to_json, status: 200, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/?page=2').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: error_response.to_json, status: 400, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
      end

      it 'raises a ESI::Errors::BadRequestError error' do
        expect do
          client.get_markets_region_orders(region_id: '1234567890', order_type: '1234567890',
                                           type_id: '1234567890')
        end.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context 'when the response is 404' do
      let(:error_response) { { 'error' => 'Not found message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: response.to_json, status: 200, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/?page=2').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: error_response.to_json, status: 404, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
      end

      it 'raises a ESI::Errors::NotFoundError error' do
        expect do
          client.get_markets_region_orders(region_id: '1234567890', order_type: '1234567890',
                                           type_id: '1234567890')
        end.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context 'when the response is 420' do
      let(:error_response) { { 'error' => 'Error limited message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: response.to_json, status: 200, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/?page=2').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: error_response.to_json, status: 420, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
      end

      it 'raises a ESI::Errors::ErrorLimitedError error' do
        expect do
          client.get_markets_region_orders(region_id: '1234567890', order_type: '1234567890',
                                           type_id: '1234567890')
        end.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context 'when the response is 422' do
      let(:error_response) { { 'error' => 'Unprocessable entity message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: response.to_json, status: 200, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/?page=2').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: error_response.to_json, status: 422, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
      end

      it 'raises a ESI::Errors::UnprocessableEntityError error' do
        expect do
          client.get_markets_region_orders(region_id: '1234567890', order_type: '1234567890',
                                           type_id: '1234567890')
        end.to raise_error(ESI::Errors::UnprocessableEntityError)
      end
    end

    context 'when the response is 500' do
      let(:error_response) { { 'error' => 'Internal server error message' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: response.to_json, status: 200, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
        stub_request(:get, 'https://esi.evetech.net/latest/markets/1234567890/orders/?page=2').with(query: { order_type: '1234567890', type_id: '1234567890' }).to_return(
          body: error_response.to_json, status: 500, headers: { 'Content-Type': 'application/json', 'X-Pages': 2 }
        )
      end

      it 'raises a ESI::Errors::InternalServerError error' do
        expect do
          client.get_markets_region_orders(region_id: '1234567890', order_type: '1234567890',
                                           type_id: '1234567890')
        end.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
