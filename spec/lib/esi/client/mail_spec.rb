# frozen_string_literal: true

RSpec.describe ESI::Client::Mail do
  subject(:client) { ESI::Client.new(user_agent: "ESI SDK Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk)") }

  describe "#delete_character_mail" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.delete_character_mail(character_id: "1234567890", mail_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.delete_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.delete_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.delete_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.delete_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.delete_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.delete_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.delete_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#delete_character_mail_label" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 422" do
      let(:response) { { "error" => "Unprocessable entity message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json, status: 422)
      end

      it "raises a ESI::Errors::UnprocessableEntityError error" do
        expect { client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890") }.to raise_error(ESI::Errors::UnprocessableEntityError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:delete, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/1234567890/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.delete_character_mail_label(character_id: "1234567890", label_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_character_mail" do
    context "when the response is 200" do
      let(:response) { { "body" => "blah blah blah", "from" => 90_000_001, "labels" => [2, 32], "read" => true, "subject" => "test", "timestamp" => "2015-09-30T16:07:00Z" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_mail(character_id: "1234567890", mail_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_character_mail(character_id: "1234567890", mail_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_character_mail_labels" do
    context "when the response is 200" do
      let(:response) { { "labels" => [{ "color" => "#660066", "label_id" => 16, "name" => "PINK", "unread_count" => 4 }, { "color" => "#ffffff", "label_id" => 17, "name" => "WHITE", "unread_count" => 1 }], "total_unread_count" => 5 } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_mail_labels(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_mail_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_mail_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_mail_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_mail_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_mail_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_character_mail_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_character_mail_labels(character_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_character_mail_lists" do
    context "when the response is 200" do
      let(:response) { [{ "mailing_list_id" => 1, "name" => "test_mailing_list" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/lists/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_mail_lists(character_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/lists/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_mail_lists(character_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/lists/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_mail_lists(character_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/lists/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_mail_lists(character_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/lists/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_mail_lists(character_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/lists/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_mail_lists(character_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/lists/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_character_mail_lists(character_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/mail/lists/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_character_mail_lists(character_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#post_character_mail" do
    context "when the response is 201" do
      let(:response) { 13 }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" })).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end

    context "when the response is 520" do
      let(:response) { { "error" => "Error 520 message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/").to_return(body: response.to_json, status: 520)
      end

      it "raises a ESI::Errors::EveServerError error" do
        expect { client.post_character_mail(character_id: "1234567890", mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::EveServerError)
      end
    end
  end

  describe "#post_character_mail_labels" do
    context "when the response is 201" do
      let(:response) { 128 }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.post_character_mail_labels(character_id: "1234567890", label: { "foo" => "bar" })).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_character_mail_labels(character_id: "1234567890", label: { "foo" => "bar" }) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_character_mail_labels(character_id: "1234567890", label: { "foo" => "bar" }) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_character_mail_labels(character_id: "1234567890", label: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_character_mail_labels(character_id: "1234567890", label: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_character_mail_labels(character_id: "1234567890", label: { "foo" => "bar" }) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.post_character_mail_labels(character_id: "1234567890", label: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/characters/1234567890/mail/labels/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.post_character_mail_labels(character_id: "1234567890", label: { "foo" => "bar" }) }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#put_character_mail" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.put_character_mail(character_id: "1234567890", mail_id: "1234567890", contents: { "foo" => "bar" })).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.put_character_mail(character_id: "1234567890", mail_id: "1234567890", contents: { "foo" => "bar" }) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.put_character_mail(character_id: "1234567890", mail_id: "1234567890", contents: { "foo" => "bar" }) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.put_character_mail(character_id: "1234567890", mail_id: "1234567890", contents: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.put_character_mail(character_id: "1234567890", mail_id: "1234567890", contents: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.put_character_mail(character_id: "1234567890", mail_id: "1234567890", contents: { "foo" => "bar" }) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.put_character_mail(character_id: "1234567890", mail_id: "1234567890", contents: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/mail/1234567890/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.put_character_mail(character_id: "1234567890", mail_id: "1234567890", contents: { "foo" => "bar" }) }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end
end
