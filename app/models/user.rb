# frozen_string_literal: true

class User
  DATA = [
    {
      id: 101,
      name: 'Dave N.',
      email: 'dave@gmail.com'
    },
    {
      id: 102,
      name: 'Simon L.',
      email: 'simon@gmail.com'
    },
    {
      id: 103,
      name: 'Frank S.',
      email: 'frank@gmail.com'
    }
  ].freeze
  
  def self.find(id)      
    DATA.select{|item| item[:id]==id.to_i}.map{|user| User.format(user)}
  end
  
  def self.find_all(ids)
    result = []
    ids.each do |id|
      result.concat(User.find(id))
    end
    result
  end
  
  private
  
  def self.format(user)
    {
      "type": "user",
      "id": user[:id],
      "attributes": {
        "name": user[:name],
        "email": user[:email]
      } 
    }
  end

end
