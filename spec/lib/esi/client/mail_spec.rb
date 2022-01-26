# frozen_string_literal: true

RSpec.describe ESI::Client::Mail, type: :stub do
  subject(:client) { ESI::Client.new(retries: 2, user_agent: 'esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)') }

  describe '#delete_character_mail' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:delete, 'https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.delete_character_mail(character_id: '1234567890', mail_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#delete_character_mail_label' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:delete, 'https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.delete_character_mail_label(character_id: '1234567890', label_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_mail' do
    context 'when the response is 200' do
      let(:response) { { 'body' => 'blah blah blah', 'from' => 90_000_001, 'labels' => [2, 32], 'read' => true, 'subject' => 'test', 'timestamp' => '2015-09-30T16:07:00Z' } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_mail(character_id: '1234567890', mail_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_mail_labels' do
    context 'when the response is 200' do
      let(:response) { { 'labels' => [{ 'color' => '#660066', 'label_id' => 16, 'name' => 'PINK', 'unread_count' => 4 }, { 'color' => '#ffffff', 'label_id' => 17, 'name' => 'WHITE', 'unread_count' => 1 }], 'total_unread_count' => 5 } }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/mail/labels/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_mail_labels(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#get_character_mail_lists' do
    context 'when the response is 200' do
      let(:response) { [{ 'mailing_list_id' => 1, 'name' => 'test_mailing_list' }] }

      before do
        stub_request(:get, 'https://esi.evetech.net/latest/characters/1234567890/mail/lists/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.get_character_mail_lists(character_id: '1234567890')).to eq(response)
      end
    end
  end

  describe '#post_character_mail' do
    context 'when the response is 201' do
      let(:response) { 13 }

      before do
        stub_request(:post, 'https://esi.evetech.net/latest/characters/1234567890/mail/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.post_character_mail(character_id: '1234567890', mail: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end

  describe '#post_character_mail_labels' do
    context 'when the response is 201' do
      let(:response) { 128 }

      before do
        stub_request(:post, 'https://esi.evetech.net/latest/characters/1234567890/mail/labels/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.post_character_mail_labels(character_id: '1234567890', label: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end

  describe '#put_character_mail' do
    context 'when the response is 204' do
      let(:response) { nil }

      before do
        stub_request(:put, 'https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/').to_return(body: response.to_json, headers: { 'Content-Type': 'application/json' })
      end

      it 'returns the response' do
        expect(client.put_character_mail(character_id: '1234567890', mail_id: '1234567890', contents: { 'foo' => 'bar' })).to eq(response)
      end
    end
  end
end
