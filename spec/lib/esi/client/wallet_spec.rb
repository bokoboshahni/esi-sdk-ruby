# frozen_string_literal: true

RSpec.describe ESI::Client::Wallet, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#get_character_wallet' do
    context 'when the response is 200' do
      let(:response) { 29_500.01 }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/wallet/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_wallet(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_wallet_journal' do
    context 'when the response is 200' do
      let(:response) { [{ 'amount' => -100_000, 'balance' => 500_000.4316, 'context_id' => 4, 'context_id_type' => 'contract_id', 'date' => '2018-02-23T14:31:32Z', 'description' => 'Contract Deposit', 'first_party_id' => 2_112_625_428, 'id' => 89, 'ref_type' => 'contract_deposit', 'second_party_id' => 1_000_132 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/wallet/journal/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_character_wallet_journal(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_wallet_transactions' do
    context 'when the response is 200' do
      let(:response) { [{ 'client_id' => 54_321, 'date' => '2016-10-24T09:00:00Z', 'is_buy' => true, 'is_personal' => true, 'journal_ref_id' => 67_890, 'location_id' => 60_014_719, 'quantity' => 1, 'transaction_id' => 1_234_567_890, 'type_id' => 587, 'unit_price' => 1 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/wallet/transactions/').with(query: { from_id: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_wallet_transactions(character_id: '1234567890', from_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_wallets' do
    context 'when the response is 200' do
      let(:response) { [{ 'balance' => 123.45, 'division' => 1 }, { 'balance' => 123.45, 'division' => 2 }, { 'balance' => 123.45, 'division' => 3 }, { 'balance' => 123.45, 'division' => 4 }, { 'balance' => 123.45, 'division' => 5 }, { 'balance' => 123.45, 'division' => 6 }, { 'balance' => 123.45, 'division' => 7 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/wallets/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_corporation_wallets(corporation_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_wallets_division_journal' do
    context 'when the response is 200' do
      let(:response) { [{ 'amount' => -1000, 'balance' => 100_000.0, 'context_id' => 2_112_625_428, 'context_id_type' => 'character_id', 'date' => '2016-10-24T09:00:00Z', 'description' => "CCP Zoetrope transferred cash from C C P's corporate account to CCP SnowedIn's account", 'first_party_id' => 109_299_958, 'id' => 1_234_567_890, 'ref_type' => 'corporation_account_withdrawal', 'second_party_id' => 95_538_921 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/wallets/1234567890/journal/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json', 'X-Pages': '1' })
      end

      it 'returns the response' do
        expect(client.get_corporation_wallets_division_journal(corporation_id: '1234567890', division: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_corporation_wallets_division_transactions' do
    context 'when the response is 200' do
      let(:response) { [{ 'client_id' => 54_321, 'date' => '2016-10-24T09:00:00Z', 'is_buy' => true, 'journal_ref_id' => 67_890, 'location_id' => 60_014_719, 'quantity' => 1, 'transaction_id' => 1_234_567_890, 'type_id' => 587, 'unit_price' => 1 }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/corporations/1234567890/wallets/1234567890/transactions/').with(query: { from_id: '1234567890' }).to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_corporation_wallets_division_transactions(corporation_id: '1234567890', division: '1234567890', from_id: '1234567890')).to eq(response)
      end
    end
  end
end
