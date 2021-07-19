# frozen_string_literal: true

RSpec.describe ESI::Client do
  it "can be instantiated" do
    user_agent = "ESI SDK Tests/1.0; +(https://github.com/bokoboshahni/esi-sdk)"
    expect(ESI::Client.new(user_agent: user_agent)).to be_a(ESI::Client)
  end
end
