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

Also, if using a sandbox, set the uri:

```ruby
Alloy::Api.api_uri = 'https://sandbox.alloy.co/' # Be sure to include the trailing slash!
```

The API supports multiple endpoints as well. The default endpoint is called `:main`, but additional endpoints can be added:

```ruby
Alloy::Api.set_endpoint(:other_endpoint, '<api_token>', '<api_secret', '<api_uri>(optional - use for sandbox)')
```

The Alloy.co api methods are implemented by the Api class. Most take a set of options, including headers and body:

```ruby
Alloy::Api.parameters(method: 'get') # The default method is 'post' - this method will get required/optional parameters for running evaluations
Alloy::Api.evaluations(body: { first_name: 'John', last_name: 'Smith' }, headers: { 'Alloy-Refresh-Cache': 'true' }) # Runs an evaluation. Headers can be set as well, but the Content-Type and Authorization are automatic
Alloy::Api.parameters(method: 'get', endpoint: :other_endpoint) # use a different endpoint - allowing for multiple workflows to be used
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
