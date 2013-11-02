# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'smart_csv/version'

Gem::Specification.new do |gem|
  gem.name           = 'smart_csv'
  gem.version        = SmartCSV::VERSION
  gem.platform       = Gem::Platform::RUBY
  gem.date           = '2013-11-02'
  gem.authors        = ['Michał Szyma']
  gem.email          = ['raglub.ruby@gmail.com']
  gem.homepage       = "https://github.com/raglub/smart_csv"
  gem.summary        = %q{Extend CSV class.}
  gem.description    = %q{Extend CSV class. CSV can delete or select some records.}
  gem.license        = "MIT"

  gem.files          = `git ls-files`.split($\)
  gem.executables    = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files     = gem.files.grep(%r{^(test|spec|features)/})

  gem.require_paths  = ['lib']

  gem.add_dependency 'bundler', '>= 1.0.0'
  gem.add_dependency 'rake'

  gem.add_development_dependency 'rspec', ">= 2.0.0"

end
