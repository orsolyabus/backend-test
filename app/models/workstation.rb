# frozen_string_literal: true

class Workstation 
  DATA = [
    {
      id: 101,
      name: "Dave's workstation",
      ip_address: '192.168.1.1',
      status: 'running',
      instance_type: 'g3.4xlarge',
      platform: 'linux',
      users: [101]
    },
    {
      id: 102,
      name: "Simon's workstation",
      ip_address: '192.168.1.2',
      status: 'running',
      instance_type: 'g3.4xlarge',
      platform: 'linux',
      users: [102]
    },
    {
      id: 103,
      name: 'Windows Workstation',
      ip_address: '192.168.1.3',
      status: 'stopped',
      instance_type: 'g3.8xlarge',
      platform: 'windows',
      users: [101, 102]
    },
    {
      id: 104,
      name: 'Backup Workstation',
      ip_address: '192.168.1.4',
      status: 'stopped',
      instance_type: 'g3.4xlarge',
      users: []
    }
  ].freeze
  
  def self.find(id, include)     
    station_raw = DATA.select{|item| item[:id]==id.to_i}.first
    station = Workstation.format(station_raw)
    result = { "data": station, } 
    if include
      users = User.find_all(station_raw[:users])
      result["included"] = users 
    end
    result    
  end
  
  def self.all(include)
    result = {"data": DATA.map{|station| Workstation.format(station)}}
    if include
      users = Set[]
      DATA.map{|station| (station[:users].each{|user| users.add(user)})}
      result["included"] = User.find_all(users)
    end
    result
  end
  
  private
  
  def self.format(station)
    formatted = {
      "type": "workstation",
      "id": "",
      "attributes": {
        "name": "",
        "ip_address": "",
        "status": "",
        "instance_type": "",
        "platform": ""
      },
      "relationships": {
        "users": {
          "data": [
          ]
        }
      }
    }
    formatted[:id] = station[:id]
    formatted[:attributes] = formatted[:attributes].map { |k,_| [k, station[k]] }.to_h 
    if station[:users]
      formatted[:relationships][:users] = station[:users].map{ |id| {"id": id, "type":"user"}}
    end
    formatted
  end
end
