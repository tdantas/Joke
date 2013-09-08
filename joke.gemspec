# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'joke/version'

Gem::Specification.new do |spec|
  spec.name          = "joke"
  spec.version       = Joke::VERSION
  spec.authors       = ["Thiago Dantas"]
  spec.email         = ["thiago.teixeira.dantas@gmail.com"]
  spec.description   = %q{Job DSL Mimicking Rake #IrresponsibleRuby}
  spec.summary       = %q{Just for Fun mimicking Rake}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

end
