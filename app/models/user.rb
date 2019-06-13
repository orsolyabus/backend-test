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
    DATA.find{|item| item[:id]==id.to_i}
  end
  
  def self.find_all(ids)
    result = []
    ids.each do |id|
      result << User.find(id)
    end
    result
  end

end
