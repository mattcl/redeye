require 'net/http'
require 'nokogiri'

module Redeye
  class Client
    attr_accessor :base_address, :base_uri

    def connect(addr)
      @base_address = addr
      @base_uri = URI("http://#{base_address}:8080/redeye/")
    end

    def info
      xml = Nokogiri::XML(open(base_uri))
      puts xml.to_s
    end
  end
end
