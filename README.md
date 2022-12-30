# DBL Rubocop

[![Test](https://github.com/dbl-works/rubocop-dbl/actions/workflows/test.yml/badge.svg)](https://github.com/dbl-works/rubocop-dbl/actions/workflows/test.yml)

RuboCop configuration for our Ruby on Rails projects.

[Official RoR RuboCop Configuration](https://github.com/rails/rails/blob/master/.rubocop.yml).

Releases are published to [GitHub's Package Service](https://github.com/dbl-works/rubocop-dbl/packages/550489).


## Installation

Install from command line:

```shell
gem install rubocop-dbl --version "0.2.0" --source "https://rubygems.pkg.github.com/dbl-works"
```

install via Gemfile:

DO NOT DO THIS:
```ruby
group :development, :test do
  gem "rubocop-dbl", "~> 0.2.0", source: "https://rubygems.pkg.github.com/dbl-works"
end
```

INSTEAD:

```ruby
# Gemfile
group :development, :test do
  gem 'rubocop-dbl', git: 'git@github.com:dbl-works/rubocop-dbl', branch: :main
end
```
WHY: we cannot install a public (!!) package from GitHub packages without a PAT (personal access token), see this [thread](https://github.community/t/download-from-github-package-registry-without-authentication/14407).
E.g. CircleCI does not allow reading a ENV var within the ci.yml, hence it is impossible to configure bundle to have auth for GitHub packages (this might work using GitHub actions).


## Usage

Add this line to your application's `.rubocop.yml`:

```yml
inherit_gem:
  rubocop-dbl:
    - config/dbl.yml
```

Or just run:

```shell
rails generate rubocop_dbl:install
```



## Configuration


### TargetRubyVersion

We only support the latest 2 versions of ruby, which is currently >= 2.7.
We only support the latest 2 versions of rails, which is currently >= 6.0.
See [test.yml](.github/workflows/test.yml) for details.


If you'd like to change `TargetRubyVersion`, see [Customization](#customization).



## Customization

If you'd like to customize the rubocop setting on your project, you can override it.

For example, if you want to change `TargetRubyVersion`, you can do it like:

```yml
# .rubocop.yml
inherit_gem:
  rubocop-dbl:
    - config/dbl.yml

# Override Setting
AllCops:
  TargetRubyVersion: 2.7.2
```

## Build & install gem locally
```shell
gem build rubocop-dbl.gemspec
gem install rubocop-dbl-0.1.0.gem
irb
```

## Publish as package on GitHub packages
* create a valid PAT (personal access token) for your GitHub user with full access to packages (read & write) and private repos (read), read the [docs](https://docs.github.com/en/free-pro-team@latest/packages/guides/configuring-rubygems-for-use-with-github-packages) for more details
* add following information to `~/.gemrc`:

```
---
:github: YOUR_PAT
:backtrace: false
:bulk_threshold: 1000
:sources:
- https://rubygems.org/
- https://rubygems.pkg.github.com
:update_sources: true
:verbose: true
:concurrent_downloads: 8
gem: "--document=yri"

```

* build the latest version of the gem locally with

```shell
gem build rubocop-dbl.gemspec
```
take note of the most current version of the gem, which will be printed to console.

* publish the gem as follows

```shell
gem push --key github --host https://"$YOUR_GITHUB_USER_NAME":"$YOUR_PAT"@rubygems.pkg.github.com/dbl-works rubocop-dbl-"$CURRENT_GEM_VERSION".gem
```

replacing `YOUR_GITHUB_USER_NAME`, `YOUR_PAT`, `CURRENT_GEM_VERSION` with the appropriate values.
