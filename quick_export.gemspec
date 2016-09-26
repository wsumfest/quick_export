# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quick_export/version'

Gem::Specification.new do |spec|
  spec.name          = "quick_export"
  spec.version       = QuickExport::VERSION
  spec.authors       = ["Will Sumfest"]
  spec.email         = ["was022@berkeley.edu"]

  spec.summary       = "Export Models in Rails Quicker"
  spec.homepage      = "https://github.com/wsumfest/quick_export"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.3"
  spec.add_development_dependency "mysql2", '~> 0.3.20'
  spec.add_dependency "activerecord", "~> 3.0"
  spec.add_dependency "activesupport", "~> 3.2.14"

end
