require 'net/http'
require 'nokogiri'

require 'redeye/requestor'

module Redeye
  class Client
    include Redeye::Requestor

    attr_reader :uri, :serial_number, :hardware_type, :name, :description

    def initialize(args={})
      @name          = args['name']
      @description   = args['description']
      @hardware_type = args['hardware_type']
      @serial_number = args['serial_number']
      @uri           = args['uri']
    end

    def rooms
      return @rooms unless @rooms.nil?
      xml = request(URI(uri))
      @rooms = xml.xpath('//rooms//room').collect { |room| Room.new(room) }
    end

    def devices

    end

    def reset
      @rooms = nil
    end

  end

  class Room
    attr_reader :id, :name, :description

    def initialize(args={})
      @id          = args['id']
      @name        = args['name']
      @description = args['description']
    end

    def devices
      xml = Nokogiri::XML(open("#{base_uri}/rooms/"))
    end
  end

  class Device

  end
end

# redeye/rooms/0/devices/1/commands/send?commandId=10
