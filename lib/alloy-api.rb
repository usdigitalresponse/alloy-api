require 'httparty'
require 'base64'
require 'json'

module Alloy
  class Api
    @@api_uri     = 'https://api.alloy.co/'
    @@api_token   = nil
    @@api_secret  = nil

    def self.api_uri=(value)
      @@api_uri = value
    end

    def self.api_token=(value)
      @@api_token = value
    end

    def self.api_secret=(value)
      @@api_secret = value
    end

    def self.method_missing(m, *args, &block)
      options = args.any? ? args[0] : {}
      method = options[:method] || "post"
      uri = "#{@@api_uri}#{m}"
      headers = {
        "Content-Type" => "application/json",
        "Authorization" => auth_param
      }.merge(options[:headers].to_h)

      JSON.parse(HTTParty.send(method, uri, {headers: headers, body: (options[:body] || {}).to_json}).body)
      # TODO: Error handling
    end

    private

    def self.auth_param
      "Basic #{encoded}"
    end

    def self.encoded
      Base64.strict_encode64 "#{@@api_token}:#{@@api_secret}"
    end
  end
end
