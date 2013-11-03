# encoding: UTF-8

module Beerbelly
  class Configuration
    attr_accessor :access_token

    def base_url
      "http://api.openbeerdatabase.com/#{current_version}"
    end

    def to_hash
      { token: access_token }
    end

    private

    def current_version
      'v1/'
    end
  end
end
