# frozen_string_literal: true

RSpec.describe ESI::Client do
  subject(:client) { ESI::Client.new(user_agent: user_agent) }

  let(:user_agent) { "esi-sdk-ruby Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk-ruby)" }

  it "can be instantiated" do
    expect(client).to be_a(ESI::Client)
  end
end
