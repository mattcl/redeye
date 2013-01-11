require 'redeye/client'

describe Redeye::Client do

  subject(:client) do
    Redeye::Client.new
  end

  its(:base_address) { should be_nil }
  its(:base_uri) { should be_nil }

  describe '#connect' do
    it 'should do something' do
      client.address('doof')
      client.base_address.should eq('doof')
      client.base_uri.should eq('http://doof:8080/redeye/')
    end
  end
end
