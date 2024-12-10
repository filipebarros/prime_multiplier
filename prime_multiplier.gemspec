# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prime_multiplier/version'

Gem::Specification.new do |spec|
  spec.name = 'prime_multiplier'
  spec.version = PrimeMultiplier::VERSION
  spec.authors = ['Filipe Barros']
  spec.email = ['afbarros@me.com']

  spec.summary = 'Prime number multiplier table'
  spec.homepage = 'https://example.com'
  spec.license = 'MIT'

  spec.files = Dir.glob('{bin,lib}/**/*') + %w[LICENSE.txt README.md]
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = 3.2

  spec.add_dependency 'terminal-table'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'standard'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
