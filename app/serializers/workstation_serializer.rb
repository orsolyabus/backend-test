class WorkstationSerializer
  attr_accessor :workstation, :include 
  
  def initialize(workstation, include)
    self.workstation = workstation
    self.include = include
  end
  
  def serialize
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
    formatted[:id] = self.workstation[:id]
    formatted[:attributes] = formatted[:attributes].map { |k,_| [k, self.workstation[k]] }.to_h 
    if self.workstation[:users]
      formatted[:relationships][:users] = self.workstation[:users].map{ |id| {"id": id, "type":"user"}}
    end
    if self.include
        users = User.find_all(self.workstation[:users])
        serialized_users = users.map{|user| 
          us = UserSerializer.new(user)
          us.serialize
        }
        formatted["included"] = serialized_users
      end
    formatted
  end
  
end