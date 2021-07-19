# frozen_string_literal: true

RSpec.describe ESI::Client::Calendar do
  subject(:client) { ESI::Client.new(user_agent: "ESI SDK Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk)") }

  describe "#get_character_calendar" do
    context "when the response is 200" do
      let(:response) { [{ "event_date" => "2016-06-26T20:00:00Z", "event_id" => 1_386_435, "event_response" => "accepted", "importance" => 0, "title" => "o7 The EVE Online Show" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/?from_event=1234567890").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_calendar(character_id: "1234567890", from_event: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/?from_event=1234567890").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_calendar(character_id: "1234567890", from_event: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/?from_event=1234567890").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_calendar(character_id: "1234567890", from_event: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/?from_event=1234567890").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_calendar(character_id: "1234567890", from_event: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/?from_event=1234567890").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_calendar(character_id: "1234567890", from_event: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/?from_event=1234567890").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_calendar(character_id: "1234567890", from_event: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/?from_event=1234567890").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_character_calendar(character_id: "1234567890", from_event: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/?from_event=1234567890").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_character_calendar(character_id: "1234567890", from_event: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_character_calendar_event" do
    context "when the response is 200" do
      let(:response) { { "date" => "2016-06-26T21:00:00Z", "duration" => 60, "event_id" => 1_386_435, "importance" => 1, "owner_id" => 1, "owner_name" => "EVE System", "owner_type" => "eve_server", "response" => "Undecided", "text" => "o7: The EVE Online Show features latest developer news, fast paced action, community overviews and a lot more with CCP Guard and CCP Mimic. Join the thrilling o7 live broadcast at 20:00 EVE time (=UTC) on <a href=\"http://www.twitch.tv/ccp\">EVE TV</a>. Don't miss it!", "title" => "o7 The EVE Online Show" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_character_calendar_event(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#get_character_calendar_event_attendees" do
    context "when the response is 200" do
      let(:response) { [{ "character_id" => 2_112_625_428, "event_response" => "accepted" }, { "character_id" => 95_465_499, "event_response" => "tentative" }] }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 404" do
      let(:response) { { "error" => "Not found message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json, status: 404)
      end

      it "raises a ESI::Errors::NotFoundError error" do
        expect { client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::NotFoundError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:get, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/attendees/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.get_character_calendar_event_attendees(character_id: "1234567890", event_id: "1234567890") }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end

  describe "#put_character_calendar_event" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json)
      end

      it "returns the response" do
        expect(client.put_character_calendar_event(character_id: "1234567890", event_id: "1234567890", response: { "foo" => "bar" })).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 400)
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.put_character_calendar_event(character_id: "1234567890", event_id: "1234567890", response: { "foo" => "bar" }) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 401)
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.put_character_calendar_event(character_id: "1234567890", event_id: "1234567890", response: { "foo" => "bar" }) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 403)
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.put_character_calendar_event(character_id: "1234567890", event_id: "1234567890", response: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 420)
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.put_character_calendar_event(character_id: "1234567890", event_id: "1234567890", response: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 500)
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.put_character_calendar_event(character_id: "1234567890", event_id: "1234567890", response: { "foo" => "bar" }) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end

    context "when the response is 503" do
      let(:response) { { "error" => "Service unavailable message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 503)
      end

      it "raises a ESI::Errors::ServiceUnavailableError error" do
        expect { client.put_character_calendar_event(character_id: "1234567890", event_id: "1234567890", response: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ServiceUnavailableError)
      end
    end

    context "when the response is 504" do
      let(:response) { { "error" => "Gateway timeout message" } }

      before do
        stub_request(:put, "https://esi.evetech.net/latest/characters/1234567890/calendar/1234567890/").to_return(body: response.to_json, status: 504)
      end

      it "raises a ESI::Errors::GatewayTimeoutError error" do
        expect { client.put_character_calendar_event(character_id: "1234567890", event_id: "1234567890", response: { "foo" => "bar" }) }.to raise_error(ESI::Errors::GatewayTimeoutError)
      end
    end
  end
end
