# encoding: UTF-8

require 'rails/generators'

module Beerbelly
  class InitializerGenerator < Rails::Generators::Base
    desc 'Creates the initializer file for Beerbelly'

    # Option for access_token
    class_option :access_token, token: :string, desc: "Set the access token"

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    end

    def install
      template 'beerbelly.rb', 'config/initializers/beerbelly.rb'
    end

  end
end
