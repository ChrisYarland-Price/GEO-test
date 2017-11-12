require_relative "spec_helper"

describe "Devices api" do
  it "should return a devices notes when a get request is received with the device name." do
    expect(DevicesApiTest.device('hub_ethernet_cosy').code).to eql(200) 
    expect(DevicesApiTest.device('hub_ethernet_cosy').parsed_response).to be_instance_of Hash
    expect(DevicesApiTest.device('hub_ethernet_cosy').parsed_response{'notes'}).to eql("notes" => "Cosy hub, Ethernet microcontroller")
  end

  it "should return all devices notes when a get request is received." do
    expect(DevicesApiTest.get_all_devices.code).to eql(200) 
    expect(DevicesApiTest.get_all_devices.parsed_response).to be_instance_of Hash
    notes =  Nokogiri::XML(DevicesApiTest.get_all_devices.to_s).search('notes')
    puts notes[0]
    expect(notes[0].text).to eql('Cosy hub, Ethernet microcontroller')
  end

  it "should error if any other requests are received" do
    expect(DevicesApiTest.send_post('hub_ethernet_cosy').code).to eql(404)
    expect(DevicesApiTest.send_delete('hub_ethernet_cosy').code).to eql(404)
    expect(DevicesApiTest.send_put('hub_ethernet_cosy').code).to eql(404)

  end
end