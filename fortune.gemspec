# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fortune/version'

Gem::Specification.new do |spec|
  spec.name          = "fortune"
  spec.version       = Fortune::VERSION
  spec.authors       = ["Malykh Oleg"]
  spec.email         = ["malykholeg@gmail.com"]
  spec.description   = %q{Ruby gem for calculate probability, odds and combinations. Mostly helpfull for gambling, e.g. Poker.}
  spec.summary       = %q{Lib for get changes, odds, probability and combinations for given values}
  spec.homepage      = "https://github.com/Fotom/Fortune"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end


