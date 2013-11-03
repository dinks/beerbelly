# encoding: UTF-8

require 'uri'
require 'httparty'

require 'beerbelly/configuration'
require 'beerbelly/client/response'
require 'beerbelly/client/beer'
require 'beerbelly/client/brewery'

module Beerbelly
  class Client

    include Beerbelly::Client::Beer
    include Beerbelly::Client::Brewery

    attr_accessor :configuration

    def configure
      yield configuration
    end

    protected

    def get_resource(path, options={})
      request_resource :get, path, options
    end

    private

    def request_resource(method, path, options={})
      resource = URI "#{configuration.base_url}#{path}.json"
      resource.query = URI.encode_www_form sanitize_options(options)

      response = HTTParty.send(method, resource.to_s)
    end

    def respond_with_resource(response, type)
      Response.new response, type
    end

    def configuration
      @configuration ||= Configuration.new
    end

    ALLOWED_OPTIONS = ['order', 'page', 'per_page', 'query', 'token'].freeze
    def sanitize_options(options)
      options.merge!(configuration.to_hash).reject { |key, value| !ALLOWED_OPTIONS.include?(key.to_s) }
    end
  end
end
