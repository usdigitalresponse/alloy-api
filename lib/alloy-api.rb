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

    def self.parameters(options={})
      perform "parameters", options.merge(method: :get)
    end

    def self.entity_details(entity_id, options = {})
      perform "entities/#{entity_id}", options.merge(method: :get)
    end

    def self.evaluation_details(entity_id, evaluation_id, options = {})
      perform "entities/#{entity_id}/evaluations/#{evaluation_id}", options.merge(method: :get)
    end

    def self.method_missing(m, *args, &block)
      perform(m, args[0] || {})
    end

    def self.perform(path, options={})
      method = options[:method] || "post"
      uri = "#{@@api_uri}#{path}"
      headers = {
        "Content-Type" => "application/json",
        "Authorization" => auth_param
      }.merge(options[:headers].to_h)
      response = HTTParty.send(method, uri, {headers: headers, body: (options[:body] || {}).to_json})
      return response if options[:raw]
      JSON.parse(response.body)
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
