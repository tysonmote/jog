# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jog/version"

Gem::Specification.new do |s|
  s.name        = "jog"
  s.version     = Jog::VERSION
  s.authors     = ["Tyson Tate"]
  s.email       = ["tyson@tysontate.com"]
  s.homepage    = "http://github.com/tysontate/jog"
  s.summary     = "Command-line tool that makes it easy to log your work."
  s.description = "Jog is a simple command-line tool that simplifies the process of logging what you've worked on, storing plain-text files in a sensible file structue."

  s.rubyforge_project = "jog"

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "thor"
  s.add_runtime_dependency "activesupport"
  s.add_runtime_dependency "colored"
end
