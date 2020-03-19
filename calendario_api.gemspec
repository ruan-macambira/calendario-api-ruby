# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calendario_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'calendario_api'
  spec.version       = CalendarioApi::VERSION
  spec.authors       = ['MxBromelia']
  spec.email         = ['ruanmacambira@gmail.com']

  spec.summary       = 'Gem Wrapper da API de http://www.calendario.com.br'
  spec.description   = 'Gem Wrapper da API de http://www.calendario.com.br'
  spec.homepage      = 'https://github.com/MxBromelia/calendario-api-ruby'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/MxBromelia/calendario-api-ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/MxBromelia/calendario-api-ruby/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  
  spec.add_development_dependency 'factory_bot', '~> 5.1'
  spec.add_development_dependency 'simplecov', '~> 0.18'
  spec.add_development_dependency 'vcr', '~> 5.1'
  spec.add_development_dependency 'webmock', '~> 3.8'

  spec.add_dependency 'rest-client'
end
