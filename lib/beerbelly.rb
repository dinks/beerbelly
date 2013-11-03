# encoding: UTF-8

require 'beerbelly/version'
require 'beerbelly/client'

module Beerbelly

  class << self
    def client
      @client ||= Beerbelly::Client.new
    end

    private

    def method_missing(method_name, *arguments, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *arguments, &block)
    end

    # Always define respond_to_missing? when overriding method_missing
    # http://robots.thoughtbot.com/always-define-respond-to-missing-when-overriding
    def respond_to_missing?(method_name, include_private = false)
      client.respond_to?(method_name) || super
    end
  end

end
