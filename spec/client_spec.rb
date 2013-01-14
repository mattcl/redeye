require 'redeye/client'

describe Redeye::Client do

  subject(:client) do
    args = {
      'name'          => 'hoof',
      'description'   => 'desc',
      'hardware_type' => 'RedEye, gen2',
      'serial_number' => 'FAKE-007',
      'uri'           => 'http://doof:8080/redeye/',
    }
    Redeye::Client.new(args)
  end

  its(:name) { should eq('hoof') }
  its(:description) { should eq('desc') }
  its(:hardware_type) { should eq('RedEye, gen2') }
  its(:serial_number) { should eq('FAKE-007') }
  its(:uri) { should eq('http://doof:8080/redeye/') }
end
