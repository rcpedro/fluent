# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fluent/version'

Gem::Specification.new do |spec|
  spec.name          = "fluent-api"
  spec.version       = Fluent::VERSION
  spec.authors       = ["Rodette Pedro"]
  spec.email         = ["rodettecpedro@gmail.com"]

  spec.summary       = "Build Fluent APIs"
  spec.description   = "A library for building fluent APIs"
  spec.homepage      = "https://github.com/rcpedro/fluent"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.2.10"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "flexcon"
  spec.add_dependency "activesupport"
end
