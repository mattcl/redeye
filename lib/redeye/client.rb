require 'net/http'
require 'nokogiri'
require 'open-uri'

module Redeye
  class Client
    attr_accessor :base_address, :base_uri

    def address(addr)
      @base_address = addr
      @base_uri = "http://#{base_address}:8080/redeye/"
    end

    def info
      xml = Nokogiri::XML(open(base_uri))
    end
  end
end
