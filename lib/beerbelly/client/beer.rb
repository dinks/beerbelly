# encoding: UTF-8

module Beerbelly
  class Client
    module Beer
      def beers(options={})
        respond_with_resource get_beers(options), 'beers'
      end

      def beer(id, options={})
        respond_with_resource get_beer(id, options), 'beer'
      end

      private

      def get_beers(options={})
        get_resource 'beers', options if respond_to? :get_resource # This I think is wrong
      end

      def get_beer(id, options={})
        get_resource "beers/#{id}", options if respond_to? :get_resource # This I think is wrong
      end
    end
  end
end
