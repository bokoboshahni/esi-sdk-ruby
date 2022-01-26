# ESI SDK Changelog

# [3.0.0](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v2.1.3...v3.0.0) (2022-01-26)


* feat!: use typhoeus and oj for api calls ([b6b150e](https://github.com/bokoboshahni/esi-sdk-ruby/commit/b6b150eff93889415ddca98d497c437470030e09))


### BREAKING CHANGES

* Typhoeus is now used instead of HTTPX for API calls and
oj is used for JSON parsing.

The following options have been removed from `ESI::Client#initialize`:

- `:cache`: Configure Typhoeus cache globally with
  `Typhoeus::Config.cache`
  (see https://github.com/typhoeus/typhoeus#caching)
- `:logger`: Configure Ethon logger globally with `Ethon.logger`
  (see https://www.rubydoc.info/github/typhoeus/ethon/Ethon/Loggable#logger=-instance_method)
- `:instrumentation`: Instrumentation support to be re-added in a later
  release.

## [2.1.3](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v2.1.2...v2.1.3) (2021-12-08)


### Bug Fixes

* ensure array for paginated responses ([55010e1](https://github.com/bokoboshahni/esi-sdk-ruby/commit/55010e18029e19b652d8c03eb90000fba186be98))

## [2.1.2](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v2.1.1...v2.1.2) (2021-10-09)

## [2.1.1](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v2.1.0...v2.1.1) (2021-10-09)

# [2.1.0](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v2.0.0...v2.1.0) (2021-10-09)


### Features

* add methods to return raw responses ([93dc308](https://github.com/bokoboshahni/esi-sdk-ruby/commit/93dc3082cf06b0b4e42e17e3de77c9e05e3345b5))

# [2.0.0](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v1.2.0...v2.0.0) (2021-10-08)


### Bug Fixes

* require name from esi/sdk to esi-sdk ([2e5e996](https://github.com/bokoboshahni/esi-sdk-ruby/commit/2e5e9966343baef91bd037579607bb562edce301))


### Features

* migrate to httpx ([fd6ec0d](https://github.com/bokoboshahni/esi-sdk-ruby/commit/fd6ec0d6910805215efceb80a5361dc4d72b9599))


### BREAKING CHANGES

* use httpx instead of faraday for http calls

# [1.2.0](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v1.1.3...v1.2.0) (2021-07-20)


### Features

* Client improvements ([bad70ae](https://github.com/bokoboshahni/esi-sdk-ruby/commit/bad70ae4d97b8b0f93019b5b4dac73f97aad7dc0))

## [1.1.3](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v1.1.2...v1.1.3) (2021-07-19)


### Bug Fixes

* Use double splat for cache options ([db32f35](https://github.com/bokoboshahni/esi-sdk-ruby/commit/db32f35fe1737af8a856720366829d2da8a036de))

## [1.1.2](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v1.1.1...v1.1.2) (2021-07-19)

## [1.1.1](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v1.1.0...v1.1.1) (2021-07-19)

# [1.1.0](https://github.com/bokoboshahni/esi-sdk-ruby/compare/v1.0.0...v1.1.0) (2021-07-19)


### Features

* Generate ESI client and unit tests ([c42f3be](https://github.com/bokoboshahni/esi-sdk-ruby/commit/c42f3beb9da9c905b24e0c1779d21bd43f8a054f))

# 1.0.0 (2021-07-18)


### Features

* Initial gem skeleton ([07c4533](https://github.com/bokoboshahni/esi-sdk-ruby/commit/07c4533a1a4d25c1025248280eb9da5f1e913021))
