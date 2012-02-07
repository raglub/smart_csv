# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "smart_csv/version"

Gem::Specification.new do |s|
  s.name        = "smart_csv"
  s.version     = SmartCSV::VERSION
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.authors     = ["Michał Szyma"]
  s.email       = ["szyma.michal@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Extend CSV class}
  s.description = %q{Extend CSV class}

  s.rubyforge_project = "active_csv"

  s.files         = `git ls-files`.split("\n") + Dir.glob("lib/**/*")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "csv"
end
