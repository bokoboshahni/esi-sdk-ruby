# frozen_string_literal: true

RSpec.describe ESI::Client::Insurance, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_insurance_prices' do
    context 'when the response is 200' do
      let(:response) { [{ 'levels' => [{ 'cost' => 10.01, 'name' => 'Basic', 'payout' => 20.01 }], 'type_id' => 1 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/insurance/prices/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_insurance_prices).to eq(response)
      end
    end
  end
end
