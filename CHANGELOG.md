# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.1.0] - 2024-03-19
### Changed
- Removed Rails cops, but auto-add Rails config when generating the config file if Rails is defined

## [2.0.0] - 2023-12-30
### Changed
- Rails Cops are only enabled, if `Rails` is a defined constant
- **breaking change** The `rubocop.yml` file must add `config/cops/rails.yml` manually, if Rails is used (or re-run the generator). This is because we can't have dynamic code in YML files. Check the README on how to update your `rubocop.yml` file; addine 2 lines to the config file is the only required (breaking) change for this version (if you use Rails).

## [1.0.1] - 2022-12-30
### Changed
- Fixed loading cops from subdirectory

## [1.0.0] - 2022-12-30
### Added
- ~linting for the changelog (and adjust formatting)~ gem for linting greatly out of date and incompatible with new Rubies
- bumped & relaxed dependencies
- support for Ruby 3.1, 3.2

### Changed
- drop support for Ruby 2.6

## [0.3.0] - 2021-01-11
### Changed
- enable new cops by default [#23](https://github.com/dbl-works/rubocop-dbl/pull/23)
- enforce never having frozen string literal comments
- Change Metrics/BlockLength, RSpec/Capybara/FeatureMethods, RSpec/NestedGroups, RSpec/MultipleMemoizedHelpers [#25](https://github.com/dbl-works/rubocop-dbl/pull/25)
- EnforcedStyle: snake_case [#26](https://github.com/dbl-works/rubocop-dbl/pull/26)
- Change Layout/HashAlignment and Style/TrailingCommaInArrayLiteral and Style/TrailingCommaInHashLiteral [#24](https://github.com/dbl-works/rubocop-dbl/pull/24)

## [0.2.2] - 2021-01-04
### Changed
- Specify envs for rails (#20)
- enforce single quotes (#19)

## [0.2.1] - 2020-12-29
### Changed
- fix filename for generator `rails generate rubocop_dbl:install` (files and dirs cannot have dashes for Rails's generators)

## [0.2.0] - 2020-12-29
### Changed
- fixes file names and other general code clean up
- enable rubocop-rails' default cops
- disable extra indentation for private methods
- Use around for Layout/EmptyLinesAroundAccessModifier
- disable Rails/HttpStatus cop, [docs](https://www.rubydoc.info/gems/rubocop-rspec/RuboCop/Cop/RSpec/Rails/HttpStatus), to allow `status: 404` rather than `status: :not_found` in controllers
- disable Rails/ApplicationController cop, [docs](https://rubocop.readthedocs.io/projects/rails/en/stable/cops_rails/#railsapplicationcontroller), to allow controllers to inherit e.g. from `Base` instead of `ApplicationController`
- adds support (CI) for Ruby 3
- document how to release new versions

## [0.1.0] - 2020-12-22
### Added
- Initial setup of a DBL-wide rubocop config, to be used in all projects if applicable.
- Please:
  - adhere to proper versioning
  - GitHub releases (we can publish a private package) => nicer for Dependabot
  - keep a meaningful Changelog
  - keep the README up-to-date, so we can copy-paste a "production-ready" snippet from the README to any project
