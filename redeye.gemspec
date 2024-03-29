# -*- encoding: utf-8 -*-
require File.expand_path('../lib/redeye/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Chun-Lum"]
  gem.email         = ["mchunlum@gmail.com"]
  gem.description   = %q{This provides an interface with a RedEye WiFi IR Blaster}
  gem.summary       = %q{This provides an interface with a RedEye Wifi IR Blaster}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "redeye"
  gem.require_paths = ["lib"]
  gem.version       = Redeye::VERSION

  # required gems
  gem.add_dependency 'nokogiri'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'fakeweb'
end
