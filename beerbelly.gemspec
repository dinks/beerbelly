# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'beerbelly/version'

Gem::Specification.new do |spec|
  spec.name          = "beerbelly"
  spec.version       = Beerbelly::VERSION
  spec.authors       = ["Dinesh Vasudevan"]
  spec.email         = ["dinesh.vasudevan@gmail.com"]
  spec.description   = %q{ An implementation for the Open Beer Database }
  spec.summary       = %q{ Users will be able to view all/one beer/brewery }
  spec.homepage      = "https://github.com/dinks/beerbelly"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "httparty", "~> 0.12.0"

  # For tests
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "vcr", "~> 2.7.0"
  spec.add_development_dependency "webmock", "~> 1.15.2"
end
