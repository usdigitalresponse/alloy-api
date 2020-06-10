Gem::Specification.new do |s|
  s.name                  = 'alloy-api'
  s.required_ruby_version = '>= 1.9.0'
  s.version               = '0.0.1'
  s.summary               = 'A wrapper for the Alloy.co API'
  s.authors               = ['Matthew Schultz']
  s.files                 = ['lib/alloy-api.rb', 'LICENSE', 'README.md', 'CHANGELOG.md']
  s.homepage              = 'https://github.com/MatthewSchultz/alloy-api'
  s.license               = 'MIT'
  s.description           = <<-DESCRIPTION
    A wrapper for the Alloy.co API. Helps to build KYC policy support into applications.
  DESCRIPTION
  s.metadata              = {
    'source_code_uri' => 'https://github.com/MatthewSchultz/alloy-api'
  }

  s.add_dependency 'httparty', '~> 0.18.0'
end
