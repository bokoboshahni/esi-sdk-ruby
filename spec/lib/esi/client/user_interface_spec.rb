# frozen_string_literal: true

RSpec.describe ESI::Client::UserInterface, type: :stub do
  subject(:client) { ESI::Client.new(user_agent: "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)") }

  describe "#post_ui_autopilot_waypoint" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/autopilot/waypoint/").with(query: { add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890" }).to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_ui_autopilot_waypoint(add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/autopilot/waypoint/").with(query: { add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890" }).to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_ui_autopilot_waypoint(add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/autopilot/waypoint/").with(query: { add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890" }).to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_ui_autopilot_waypoint(add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/autopilot/waypoint/").with(query: { add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890" }).to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_ui_autopilot_waypoint(add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/autopilot/waypoint/").with(query: { add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890" }).to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_ui_autopilot_waypoint(add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/autopilot/waypoint/").with(query: { add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890" }).to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_ui_autopilot_waypoint(add_to_beginning: "1234567890", clear_other_waypoints: "1234567890", destination_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_ui_openwindow_contract" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/contract/").with(query: { contract_id: "1234567890" }).to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_ui_openwindow_contract(contract_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/contract/").with(query: { contract_id: "1234567890" }).to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_ui_openwindow_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/contract/").with(query: { contract_id: "1234567890" }).to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_ui_openwindow_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/contract/").with(query: { contract_id: "1234567890" }).to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_ui_openwindow_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/contract/").with(query: { contract_id: "1234567890" }).to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_ui_openwindow_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/contract/").with(query: { contract_id: "1234567890" }).to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_ui_openwindow_contract(contract_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_ui_openwindow_information" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/information/").with(query: { target_id: "1234567890" }).to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_ui_openwindow_information(target_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/information/").with(query: { target_id: "1234567890" }).to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_ui_openwindow_information(target_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/information/").with(query: { target_id: "1234567890" }).to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_ui_openwindow_information(target_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/information/").with(query: { target_id: "1234567890" }).to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_ui_openwindow_information(target_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/information/").with(query: { target_id: "1234567890" }).to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_ui_openwindow_information(target_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/information/").with(query: { target_id: "1234567890" }).to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_ui_openwindow_information(target_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_ui_openwindow_marketdetails" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/marketdetails/").with(query: { type_id: "1234567890" }).to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_ui_openwindow_marketdetails(type_id: "1234567890")).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/marketdetails/").with(query: { type_id: "1234567890" }).to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_ui_openwindow_marketdetails(type_id: "1234567890") }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/marketdetails/").with(query: { type_id: "1234567890" }).to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_ui_openwindow_marketdetails(type_id: "1234567890") }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/marketdetails/").with(query: { type_id: "1234567890" }).to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_ui_openwindow_marketdetails(type_id: "1234567890") }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/marketdetails/").with(query: { type_id: "1234567890" }).to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_ui_openwindow_marketdetails(type_id: "1234567890") }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/marketdetails/").with(query: { type_id: "1234567890" }).to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_ui_openwindow_marketdetails(type_id: "1234567890") }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end

  describe "#post_ui_openwindow_newmail" do
    context "when the response is 204" do
      let(:response) { nil }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/newmail/").to_return(body: response.to_json, headers: { "Content-Type": "application/json" })
      end

      it "returns the response" do
        expect(client.post_ui_openwindow_newmail(new_mail: { "foo" => "bar" })).to eq(response)
      end
    end

    context "when the response is 400" do
      let(:response) { { "error" => "Bad request message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/newmail/").to_return(body: response.to_json, status: 400, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::BadRequestError error" do
        expect { client.post_ui_openwindow_newmail(new_mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::BadRequestError)
      end
    end

    context "when the response is 401" do
      let(:response) { { "error" => "Unauthorized message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/newmail/").to_return(body: response.to_json, status: 401, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnauthorizedError error" do
        expect { client.post_ui_openwindow_newmail(new_mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::UnauthorizedError)
      end
    end

    context "when the response is 403" do
      let(:response) { { "error" => "Forbidden message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/newmail/").to_return(body: response.to_json, status: 403, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ForbiddenError error" do
        expect { client.post_ui_openwindow_newmail(new_mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ForbiddenError)
      end
    end

    context "when the response is 420" do
      let(:response) { { "error" => "Error limited message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/newmail/").to_return(body: response.to_json, status: 420, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::ErrorLimitedError error" do
        expect { client.post_ui_openwindow_newmail(new_mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::ErrorLimitedError)
      end
    end

    context "when the response is 422" do
      let(:response) { { "error" => "Unprocessable entity message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/newmail/").to_return(body: response.to_json, status: 422, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::UnprocessableEntityError error" do
        expect { client.post_ui_openwindow_newmail(new_mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::UnprocessableEntityError)
      end
    end

    context "when the response is 500" do
      let(:response) { { "error" => "Internal server error message" } }

      before do
        stub_request(:post, "https://esi.evetech.net/latest/ui/openwindow/newmail/").to_return(body: response.to_json, status: 500, headers: { "Content-Type": "application/json" })
      end

      it "raises a ESI::Errors::InternalServerError error" do
        expect { client.post_ui_openwindow_newmail(new_mail: { "foo" => "bar" }) }.to raise_error(ESI::Errors::InternalServerError)
      end
    end
  end
end
