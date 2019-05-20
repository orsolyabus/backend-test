# frozen_string_literal: true

class Workstation < ApplicationRecord
  DATA = [
    {
      id: 101,
      name: "Dave's workstation",
      ipAddress: '192.168.1.1',
      status: 'running',
      instanceType: 'g3.4xlarge',
      platform: 'linux',
      users: [101]
    },
    {
      id: 102,
      name: "Simon's workstation",
      ipAddress: '192.168.1.2',
      status: 'running',
      instanceType: 'g3.4xlarge',
      platform: 'linux',
      users: [102]
    },
    {
      id: 103,
      name: 'Windows Workstation',
      ipAddress: '192.168.1.3',
      status: 'stopped',
      instanceType: 'g3.8xlarge',
      platform: 'windows',
      users: [101, 102]
    },
    {
      id: 104,
      name: 'Backup Workstation',
      ipAddress: '192.168.1.4',
      status: 'stopped',
      instanceType: 'g3.4xlarge',
      users: []
    }
  ].freeze
end
