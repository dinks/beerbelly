# encoding: UTF-8

require 'uri'

module BeerbellySetup
  class << self
    def configure
      @configuration = Beerbelly.configure do |c|
                        # Exposing a Read Only Token !
                        c.access_token = 'd6eade1803403eba46e8a382c20cec2958624c56fcc71541cfccc39d41478cd8'
                      end
    end

    def stub_get(path, options={})
      stub_request :get, open_beer_url(path, options)
    end

    def open_beer_url(path, options={})
      resource = URI "#{@configuration.base_url}#{path}"
      resource.query = URI.encode_www_form options

      resource.to_s
    end
  end
end
