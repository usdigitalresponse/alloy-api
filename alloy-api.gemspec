Gem::Specification.new do |s|
  s.name                  = 'alloy-api'
  s.required_ruby_version = '>= 2.0.0'
  s.version               = '0.0.6'
  s.summary               = 'A wrapper for the Alloy.co API'
  s.authors               = ['Matthew Schultz']
  s.files                 = ['lib/alloy-api.rb', 'LICENSE', 'README.md', 'CHANGELOG.md']
  s.homepage              = 'https://rubygems.org/gems/alloy-api'
  s.license               = 'MIT'
  s.description           = <<-DESCRIPTION
    A wrapper for the Alloy.co API. Helps to build KYC policy support into applications.
  DESCRIPTION
  s.metadata              = {
    'source_code_uri' => 'https://github.com/usdigitalresponse/alloy-api'
  }

  s.add_dependency 'httparty', '~> 0.18'
end
