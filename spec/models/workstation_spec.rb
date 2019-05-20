# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Workstation do
  it 'should store the data in a DATA constant' do
    expect(!Workstation::DATA.empty?).to eq true
  end
end
