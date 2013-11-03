# encoding: UTF-8

require 'beerbelly/client/resources/brewery'

module Beerbelly
  class Beer < Resource
    attr_accessor :id, :name, :description, :abv, :created_at, :updated_at, :brewery

    def brewery=(b)
      @brewery = Beerbelly::Brewery.build b
    end
  end
end
