# -*- encoding: utf-8 -*-
require File.expand_path('../lib/perftools-rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'perftools-rails'
  s.version     = PerfTools::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Theo Hultberg']
  s.email       = ['theo@iconara.net']
  s.homepage    = 'http://github.com/iconara/perftools-rails'
  s.summary     = 'Profile Rails applications with perftools.rb'
  s.description = ''

  s.required_rubygems_version = '>= 1.3.6'
  s.rubyforge_project         = 'perftools-rails'

  s.add_runtime_dependency 'perftools.rb'

  s.add_development_dependency 'bundler', '~> 1.0.0'
  s.add_development_dependency 'rails', '~> 3.0.0'

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
