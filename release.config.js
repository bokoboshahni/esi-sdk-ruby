module.exports = {
  branches: ['main'],
  plugins: [
    ['@semantic-release/commit-analyzer', {
      releaseRules: [
        { breaking: true, release: 'major' },
        { revert: true, release: 'patch' },
        { type: 'feat', release: 'minor' },
        { type: 'fix', release: 'patch' },
        { type: 'perf', release: 'patch' },
        { type: 'refactor', release: 'patch' },
        { type: 'test', release: 'patch' },
        { type: 'ci', release: 'patch' },
        { type: 'docs', release: false },
      ]
    }],
    '@semantic-release/release-notes-generator',
    ['@semantic-release/changelog', {
      changelogTitle: '# ESI SDK Changelog'
    }],
    ['@semantic-release/exec', {
      prepareCmd: "VERSION=${nextRelease.version} bundle exec rake set_version"
    }],
    ['@semantic-release/git', {
      assets: ['CHANGELOG.md', 'lib/esi/version.rb']
    }],
    ['@semantic-release/exec', {
      publishCmd: "bundle exec rake build release:rubygem_push"
    }],
    '@semantic-release/github'
  ]
}
