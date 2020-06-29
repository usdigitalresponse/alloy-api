require 'httparty'
require 'base64'
require 'json'

module Alloy
  class Api
    @@api_endpoints = { main: { uri: 'https://api.alloy.co/' } }

    def self.api_uri=(value)
      @@api_endpoints[:main][:uri] = value
    end

    def self.api_token=(value)
      @@api_endpoints[:main][:token] = value
    end

    def self.api_secret=(value)
      @@api_endpoints[:main][:secret] = value
    end

    def self.set_endpoint(name, token, secret, uri = 'https://api.alloy.co/')
      @@api_endpoints[name] = {
        uri: uri,
        token: token,
        secret: secret
      }
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
      endpoint = options[:endpoint] || :main
      uri = "#{@@api_endpoints[endpoint][:uri]}#{path}"
      body_encoding = options[:body_encoding] || :to_json
      headers = {
        "Content-Type" => "application/json",
        "Authorization" => auth_param(endpoint)
      }.merge(options[:headers].to_h)
      if options[:body_stream].present?
        response = HTTParty.send(method, uri, { headers: headers, body_stream: options[:body_stream] })
      else
        response = HTTParty.send(method, uri, { headers: headers, body: (options[:body] || {}).send(body_encoding) })
      end
      return response if options[:raw]
      JSON.parse(response.body)
      # TODO: Error handling
    end

    private

    def self.auth_param(endpoint)
      "Basic #{Base64.strict_encode64("#{@@api_endpoints[endpoint][:token]}:#{@@api_endpoints[endpoint][:secret]}")}"
    end
  end
end
