class Device
  attr_accessor :name

  def self.open_file
  @xml_devices = Nokogiri::XML(open('data/mini-schema.xml'))
  end

  def self.find(var)
    open_file
    notes = []
    @xml_devices.search('name').each do |device|
      if device.text === var 
        return device.parent.search('notes').to_xml
      end
    end
    
  end

  def self.all
    open_file
    array_of_device_notes = ""
    @xml_devices.search('devices').each do |device|
      array_of_device_notes << device.to_xml
    end
    array_of_device_notes
  end
  
  
end