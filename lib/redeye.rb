require 'redeye/version'
require 'redeye/client'
require 'redeye/requestor'

module Redeye
  DEFAULT_PORT = '8080'
  extend Redeye::Requestor

  def self.connect(address, opts={})
    port = opts[:port] ? opts[:port] : Redeye::DEFAULT_PORT
    uri = URI("http://#{address}:#{port}/redeye/")
    begin
      xml = self.request(uri)
      hardware = xml.at_xpath('//redeye')
      Client.new({
        'name'          => hardware['name'],
        'description'   => hardware['description'],
        'serial_number' => hardware['serialNumber'],
        'hardware_type' => hardware['hardwareType'],
        'uri'           => uri.to_s,
      })
    rescue
      raise "Cannot connect to physical RedEye device at: #{uri.to_s}"
    end
  end

end
