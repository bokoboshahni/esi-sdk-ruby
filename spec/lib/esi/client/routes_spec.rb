# frozen_string_literal: true

RSpec.describe ESI::Client::Route, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_route_origin_destination' do
    context 'when the response is 200' do
      let(:response) { [30_002_771, 30_002_770, 30_002_769, 30_002_772] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/route/1234567890/1234567890/').with(query: { avoid: '1234567890', connections: '1234567890', flag: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_route_origin_destination(destination: '1234567890', origin: '1234567890', avoid: '1234567890', connections: '1234567890', flag: '1234567890')).to eq(response)
      end
    end
  end
end
