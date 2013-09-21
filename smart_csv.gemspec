# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'smart_csv/version'

Gem::Specification.new do |gem|
  gem.name        = 'smart_csv'
  gem.version     = SmartCSV::VERSION
  gem.date        = '2013-09-22'
  gem.authors     = ['Michał Szyma']
  gem.email       = ['raglub.ruby@gmail.com']
  gem.homepage    = "https://github.com/raglub/smart_csv"
  gem.summary     = %q{Extend CSV class.}
  gem.description = %q{Extend CSV class. CSV can delete or select some records.}

  gem.files = `git ls-files`.split($\)
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})

  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec'
end
