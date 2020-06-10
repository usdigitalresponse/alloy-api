# Alloy API
A simple gem to wrap Alloy.co's API for doing KYC in ruby applications.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'alloy-api'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install alloy-api
```

## Usage

Start by requiring the api:

```ruby
require 'alloy-api'
```

Then set the token and secret for the workflow to use:

```ruby
Alloy::Api.api_token = 'provided by the workflow'
Alloy::Api.api_secret = 'provided by the workflow'
```

If using Rails, this can be done in either the environment files or an initializer, but remember not to include the raw keys in repositories!

Also, if using a sandbox, set the endpoint:

```ruby
Alloy::Api.api_uri = 'https://sandbox.alloy.co/' # Be sure to include the trailing slash!
```


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
