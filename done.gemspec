# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "done/version"

Gem::Specification.new do |s|
  s.name        = "done"
  s.version     = Done::VERSION
  s.authors     = ["Tyson Tate"]
  s.email       = ["tyson@tysontate.com"]
  s.homepage    = "http://github.com/tysontate/done"
  s.summary     = "Command-line tool that makes it easy to log your work."
  s.description = "Done is a simple command-line tool that simplifies the process of logging what you've worked on, storing plain-text files in a sensible file structue."

  s.rubyforge_project = "done"

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "thor"
  s.add_runtime_dependency "activesupport"
end
