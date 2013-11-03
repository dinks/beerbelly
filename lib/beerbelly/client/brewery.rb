# encoding: UTF-8

module Beerbelly
  class Client
    module Brewery
      def breweries(options={})
        respond_with_resource get_breweries(options), 'breweries'
      end

      def brewery(id, options={})
        respond_with_resource get_brewery(id, options), 'brewery'
      end

      private

      def get_breweries(options={})
        get_resource 'breweries', options if respond_to? :get_resource # This I think is wrong
      end

      def get_brewery(id, options={})
        get_resource "breweries/#{id}", options if respond_to? :get_resource # This I think is wrong
      end
    end
  end
end
