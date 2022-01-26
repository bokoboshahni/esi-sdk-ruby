# frozen_string_literal: true

RSpec.describe ESI::Client::Status, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_status' do
    context 'when the response is 200' do
      let(:response) { { 'players' => 12_345, 'server_version' => '1132976', 'start_time' => '2017-01-02T12:34:56Z' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/status/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_status).to eq(response)
      end
    end
  end
end
