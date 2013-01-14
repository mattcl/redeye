require 'net/http'
require 'nokogiri'
require 'open-uri'

module Redeye
  class Client
    attr_accessor :base_address, :base_uri
    attr_reader :serial_number, :hardware_type, :name, :description

    def address(addr)
      @base_address = addr
      @base_uri = "http://#{base_address}:8080/redeye/"
    end

    def info
      xml = Nokogiri::XML(open(base_uri))
      attrs = xml.children.first.attributes
    end

    def devices
      # TODO: eventually support redeye pro devices
      xml = Nokogiri::XML(open("#{base_uri}/rooms/0/devices/"))
    end

  end

  class Room
  end

  class Device

  end
end

# redeye/rooms/0/devices/1/commands/send?commandId=10
