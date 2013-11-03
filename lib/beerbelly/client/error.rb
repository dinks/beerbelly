# encoding: UTF-8

module Beerbelly
  class Client
    class Error < Struct.new(:code)
      def to_s
        case code
        when 400
          'Invalid query'
        when 401
          'Unauthorized'
        when 404
          'Not found'
        when 406
          'Invalid format'
        end
      end
    end
  end
end
