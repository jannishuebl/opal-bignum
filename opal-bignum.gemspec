# -*- encoding: utf-8 -*-
$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'opal/bignum/version'

Gem::Specification.new do |s|
  s.name         = 'opal-bignum'
  s.version      = Opal::Bignum::VERSION
  s.author       = 'Jannis Hübl'
  s.email        = 'jannis.huebl@gmail.com'
  s.summary      = 'Bignumbers for Opal'
  s.description  = 'Add Bignumbers to Opal'
  s.license      = 'MIT'

  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ['lib']

  s.add_dependency 'opal', ['>= 0.5.0', '< 1.0.0']
  s.add_dependency 'opal-activesupport'

  s.add_development_dependency 'opal-rspec', '>= 0.2.1'
  s.add_development_dependency 'rake'
end
