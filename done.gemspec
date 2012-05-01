# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "done/version"

Gem::Specification.new do |s|
  s.name        = "done"
  s.version     = Done::VERSION
  s.authors     = ["Tyson Tate"]
  s.email       = ["tyson@tysontate.com"]
  s.homepage    = "http://github.com/tysontate/done"
  s.summary     = "TODO"
  s.description = "TODO"

  s.rubyforge_project = "done"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "pry"
  s.add_runtime_dependency "thor"
  s.add_runtime_dependency "activesupport"
end
