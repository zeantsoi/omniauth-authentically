# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/authentically/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-authentically'
  s.version  = OmniAuth::Authentically::VERSION
  s.authors  = ['Mark Dodwell']
  s.email    = ['mark@mkdynamic.co.uk']
  s.summary  = 'Authentically strategy for OmniAuth'
  s.homepage = 'https://github.com/zeantsoi/omniauth-authentically'

  s.files         = Dir["{lib}/**/*", "omniauth-authentically.gemspec", "Gemfile", "Rakefile"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.0.0'

  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rake'
end
