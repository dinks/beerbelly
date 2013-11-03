# encoding: UTF-8

module Beerbelly
  class Resource
    class << self
      def build(data)
        new_object = new
        data.each do |key, value|
          new_object.send("#{key}=", value) if new_object.respond_to?("#{key}=")
        end
        new_object
      end
    end
  end
end
