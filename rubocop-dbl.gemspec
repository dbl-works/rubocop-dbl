Gem::Specification.new do |spec|
  spec.name                  = 'rubocop-dbl'
  spec.version               = '1.0.0'
  spec.summary               = 'RuboCop configuration for our Ruby on Rails projects'
  spec.description           = 'RuboCop configuration for our Ruby on Rails projects'
  spec.author                = 'Team DBL :rocket:'
  spec.email                 = 'oss@dbl.works'
  spec.files                 = Dir['README.md', 'LICENSE', 'config/*.yml', 'lib/**/*']
  spec.homepage              = 'https://github.com/dbl-works/rubocop-dbl'
  spec.license               = 'MIT'
  # rubocop:disable Gemspec/RequiredRubyVersion
  spec.required_ruby_version = '>= 2.7'
  # rubocop:enable Gemspec/RequiredRubyVersion

  spec.add_dependency 'railties', '>= 5'
  spec.add_dependency 'rubocop-ast', '~> 1'
  spec.add_dependency 'rubocop-packaging', '~> 0.5'
  spec.add_dependency 'rubocop-performance', '~> 1'
  spec.add_dependency 'rubocop-rails', '~> 2'
  spec.add_dependency 'rubocop-rspec', '~> 2'
  spec.add_dependency 'rubocop-sorbet', '~> 0.6'
  spec.add_dependency 'rubocop', '~> 1'

  spec.add_development_dependency 'parse_a_changelog'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
