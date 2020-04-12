# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spain_phone/version'

Gem::Specification.new do |spec|
  spec.name          = 'spain_phone'
  spec.version       = '0.1.2'
  spec.authors       = ['nevadajames']
  spec.email         = ['nevadajames@gmail.com']

  spec.summary       = 'Validates Spanish phone numbers'
  spec.description   = 'Validates Spanish landlines and mobile numbers. There are also methods to get province for landline numbers and type.'
  spec.homepage      = 'https://github.com/nevadajames/spain_phone'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '>= 11.2.2', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
