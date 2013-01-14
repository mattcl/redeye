require 'redeye'
require 'redeye/client'
require 'fakeweb'

describe Redeye do

  before(:each) do
    @body = '<redeye serialNumber="FAKE-11111" hardwareType="RedEye, gen2" description="desc" name="hoof"/>'
  end

  describe '.connect' do
    it 'should raise an error if it cannot connect' do
      uri = 'http://hoof:8080/redeye/'
      FakeWeb.register_uri(:get, uri, :status => ['404'])
      expect {
        Redeye.connect('hoof')
      }.to raise_error("Cannot connect to physical RedEye device at: http://hoof:8080/redeye/")
    end

    it 'should return a client object on success' do
      uri = 'http://hoof:8080/redeye/'
      FakeWeb.register_uri(:get, uri, :body => @body)
      obj = Redeye.connect('hoof')
      obj.class.should eq(Redeye::Client)
      obj.name.should eq('hoof')
      obj.description.should eq('desc')
      obj.serial_number.should eq('FAKE-11111')
      obj.hardware_type.should eq('RedEye, gen2')
      obj.uri.should eq(uri)
    end

    it 'should allow you to specify the port as an option' do
      uri = 'http://hoof:1111/redeye/'
      FakeWeb.register_uri(:get, uri, :body => @body)
      obj = Redeye.connect('hoof', :port => '1111')
    end
  end
end
