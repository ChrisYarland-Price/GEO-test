class Device
  attr_accessor :name

  def self.open_file
  Nokogiri::XML(open('data/mini-schema.xml'))
  end

  def self.find(var)
    open_file.search('name').each do |device|
      if device.text === var 
        return device.parent.search('notes').to_xml
      end
    end
    
  end

  def self.all
    array_of_device_notes = []
    open_file.search('devices').each do |device|
      array_of_device_notes << device.search('notes').to_xml
    end
    array_of_device_notes.to_xml
  end
  
  
end