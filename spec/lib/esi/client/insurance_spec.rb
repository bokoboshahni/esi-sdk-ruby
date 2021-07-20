# frozen_string_literal: true

RSpec.describe ESI::Client::Insurance, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#get_insurance_prices" do
    context "when the response is 200" do
      let(:response) { [{ "levels" => [{ "cost" => 10.01, "name" => "Basic", "payout" => 20.01 }], "type_id" => 1 }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/insurance/prices/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_insurance_prices).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/insurance/prices/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_insurance_prices }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/insurance/prices/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_insurance_prices }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/insurance/prices/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_insurance_prices }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
