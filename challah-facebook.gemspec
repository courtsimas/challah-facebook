# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'challah/facebook/version'

Gem::Specification.new do |s|
  s.name          = "challah-facebook"
  s.version       = Challah::Facebook::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ["John Tornow"]
  s.email         = ["john@johntornow.com"]
  s.homepage      = "http://github.com/jdtornow/challah-facebook"
  s.summary       = "Facebook authentication interface for Challah."
  s.description   = %Q{A Challah plugin to allow authentication and registration with Facebook API.}
  s.files         = Dir.glob("{test,lib}/**/*") + %w(README.md CHANGELOG.md)
  s.require_paths = ["lib"]

  s.add_dependency 'challah', '>= 0.9.0.pre'
  s.add_dependency 'rails', '>= 3.1'
  s.add_dependency 'rake', '>= 0.9.2'

  s.required_ruby_version     = Gem::Requirement.new('>= 1.9.2')
end