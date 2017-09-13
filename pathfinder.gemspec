# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pathfinder/version"

Gem::Specification.new do |spec|
  spec.name          = "pathfinder"
  spec.version       = Pathfinder::VERSION
  spec.authors       = ["Mike Arnold"]
  spec.email         = ["dharmamike@gmail.com"]

  spec.summary       = %q{A solution to http://adventofcode.com/2016/day/1}
  spec.description   = %q{A solution to http://adventofcode.com/2016/day/1}
  spec.homepage      = "https://github.com/dharmamike/pathfinder"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
