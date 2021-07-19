# EVE Swagger Interface (ESI) SDK

ESI SDK is a Ruby API client for the EVE Swagger Interface (ESI), the official API for the [EVE Online](https://eveonline.com) MMORPG.

## Installation

Add this line to your application's `Gemfile`:

```ruby
gem 'esi-sdk'
```

And then execute:

```shell
bundle install
```

Or install it yourself with:

```shell
gem install esi-sdk
```

## Usage

Create an instance of `ESI::Client` with your own `User-Agent`:

```ruby
require 'esi-sdk'

client = ESI::Client.new(user_agent: 'My ESI Bot/1.0; +(https://example.com)')
```

Call an ESI endpoint:

```ruby
response = client.get_character(character_id: 2113024536)

{
  "alliance_id" => 99003214,
  "ancestry_id" => 37,
  "birthday" => "2017-07-20T16:28:17Z",
  "bloodline_id" => 13,
  "corporation_id" => 98169165,
  "description" => "",
  "gender" => "male",
  "name" => "Bokobo Shahni",
  "race_id" => 4,
  "security_status" => 0.7826388230000001
}
```

See the documentation for [ESI::Client](https://bokoboshahni.github.io/esi-sdk-ruby/ESI/Client.html) for detailed information on each endpoint.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bokoboshahni/esi-sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/bokoboshahni/esi-sdk/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the ESI SDK's project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/bokoboshahni/esi-sdk/blob/master/CODE_OF_CONDUCT.md).

## License

Copyright © 2020 Bokobo Shahni <shahni@bokobo.space>


Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### CCP hf. Developer License Agreement

This software is developed in accordance with the [CCP hf. Developer License Agreement](https://developers.eveonline.com/resource/license-agreement).

CCP Tools and Game Data as defined by the CCP hf. Developer License Agreement &copy; is 2014 CCP hf. All rights reserved.

"EVE", "EVE Online", "CCP", and all related logos and images are trademarks or registered trademarks of CCP hf.
