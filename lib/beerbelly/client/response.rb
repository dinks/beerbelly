# encoding: UTF-8

require "beerbelly/client/error"
require "beerbelly/client/resources/resource"
require "beerbelly/client/resources/beer"
require "beerbelly/client/resources/brewery"

module Beerbelly
  class Client
    class Response
      attr_reader :page, :pages, :total, :objects
      def initialize(response, type)
        return Beerbelly::Client::Error.new(response.code) if response.code != 200

        case type
        when 'beers'
          @objects = response[type].collect { |beer| Beerbelly::Beer.build beer }
        when 'beer'
          @objects = [ Beerbelly::Beer.build(response.to_hash) ]
        when 'breweries'
          @objects = response[type].collect { |beer| Beerbelly::Brewery.build beer }
        when 'brewery'
          @objects = [ Beerbelly::Brewery.build(response.to_hash) ]
        end
      end
    end
  end
end
