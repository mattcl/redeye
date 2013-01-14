require 'nokogiri'

module Redeye
  module Requestor
    def request(uri)
      Nokogiri::XML(Net::HTTP.get(uri))
    end
  end
end
