# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
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

  spec.files = Dir.glob('{bin,lib}/**/*') + %w(LICENSE.txt README.md)
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_rubygems_version = '~> 2.3'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.43'
end
