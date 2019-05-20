# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  it 'should store the data in a DATA constant' do
    expect(!User::DATA.empty?).to eq true
  end
end
