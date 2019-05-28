# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'should store the data in a DATA constant' do
    expect(!User::DATA.empty?).to eq true
  end
  
  describe "#find" do
    it "returns one user in an array" do
      user = User.find(101)
      expect(user).to eq([{
        "type": "user",
        "id": 101,
        "attributes": {
          "name": 'Dave N.',
          "email": 'dave@gmail.com'
        } 
      }])
    end
  end
  
  describe "#find_all" do
    it "returns an array of 3 users" do
      users = User.find_all([101, 102, 103])
      expect(users.length).to eq(3)
    end
  end
end
