require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rubocop/rake_task'
require 'logger'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

RuboCop::RakeTask.new

task :rails_test do
  rails_test_dir = 'rails_test'
  except_cops = %w[
    Style/StringLiterals
    Style/FrozenStringLiteralComment
    Style/SymbolArray
    Bundler/OrderedGems
    Style/ClassAndModuleChildren
    Layout/SpaceInsidePercentLiteralDelimiters
    Sorbet
  ].freeze

  sh "rails new #{rails_test_dir} --skip-webpack-install"
  cp './test/fixture/.rubocop.yml', "#{rails_test_dir}/.rubocop.yml"
  cd rails_test_dir do
    # Rails generates files which have some rubocop offenses:
    # Style/StringLiterals, FrozenStringLiteralComment SymbolArray Bundler/OrderedGems Style/ClassAndModuleChildren
    # Layout/SpaceInsidePercentLiteralDelimiters
    #
    # Run rubocop and check there are no offenses except those rules.
    sh "rubocop --format tap --except=#{except_cops.join(',')} ."
  end
  rm_rf rails_test_dir
end

task default: %i[test rubocop rails_test]
