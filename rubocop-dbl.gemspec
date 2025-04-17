lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop_dbl/version'

Gem::Specification.new do |spec|
  spec.name                  = 'rubocop-dbl'
  spec.version               = RubocopDbl::VERSION
  spec.summary               = 'RuboCop configuration for our Ruby on Rails projects'
  spec.description           = 'RuboCop configuration for our Ruby on Rails projects'
  spec.author                = 'Team DBL :rocket:'
  spec.email                 = 'oss@dbl.works'
  spec.files                 = Dir[
    'config/*.yml',
    'config/cops/*.yml',
    'lib/**/*',
    'LICENSE',
    'README.md',
  ]
  spec.homepage              = 'https://github.com/dbl-works/rubocop-dbl'
  spec.license               = 'MIT'
  spec.required_ruby_version = '>= 3.0'

  spec.add_dependency 'rubocop', '~> 1'
  spec.add_dependency 'rubocop-ast', '~> 1'
  spec.add_dependency 'rubocop-packaging', '~> 0.5'
  spec.add_dependency 'rubocop-performance', '~> 1'
  spec.add_dependency 'rubocop-rspec', '~> 3'
  spec.add_dependency 'rubocop-sorbet', '~> 0.10'

  spec.add_dependency 'rubocop-rails', '~> 2' if defined?(Rails)

  spec.metadata['rubygems_mfa_required'] = 'true'
end
