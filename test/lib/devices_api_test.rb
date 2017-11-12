class DevicesApiTest 
    include HTTParty
  base_uri 'http://localhost:9292'
  format :xml

  def self.get_all_devices
    self.get('/', format: :xml)
  end

  def self.device(name)
    self.get("/#{name}")
  end

  def self.send_post(name)
    self.post("/#{name}")
  end

  def self.send_delete(name)
    self.delete("/#{name}")
  end

  def self.send_put(name)
    self.put("/#{name}")
  end

  
  
end