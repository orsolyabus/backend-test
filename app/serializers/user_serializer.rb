class UserSerializer
  attr_accessor :user
  
  def initialize(user)
    self.user = user
  end
  
  def serialize
    {
      "type": "user",
      "id": self.user[:id],
      "attributes": {
        "name": self.user[:name],
        "email": self.user[:email]
      } 
    }
  end
  
end