# encoding: UTF-8

require "beerbelly/client/error"
require "beerbelly/client/resources/resource"
require "beerbelly/client/resources/beer"
require "beerbelly/client/resources/brewery"

module Beerbelly
  class Client
    class Response
      extend Forwardable

      attr_reader :page, :pages, :total, :objects

      def_delegators :@objects, :[], :length, :first, :last

      def initialize(response, type)
        return Beerbelly::Client::Error.new(response.code) if response.code != 200

        case type
        when 'beers'
          @objects = response[type].collect { |beer| Beerbelly::Beer.build beer }
        when 'beer'
          @objects = [ Beerbelly::Beer.build(response.to_hash) ]
        when 'breweries'
          @objects = response[type].collect { |brewery| Beerbelly::Brewery.build brewery }
        when 'brewery'
          @objects = [ Beerbelly::Brewery.build(response.to_hash) ]
        end
      end
    end
  end
end
