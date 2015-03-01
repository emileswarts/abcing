# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'abcing/version'

Gem::Specification.new do |spec|
  spec.name          = "abcing"
  spec.version       = Abcing::VERSION
  spec.authors       = ["Emile"]
  spec.email         = ["emile.swarts123@gmail.com"]
  spec.summary       = %q{Idiot code metrics}
  spec.description   = %q{Find classes mentioned in your application but not in your test suite.}
  spec.homepage      = "https://github.com/emileswarts/ABCing"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['abcing']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency 'codeclimate-test-reporter'
end
