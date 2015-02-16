class Order < ActiveRecord::Base
  belongs_to :user
  TIMERANGES = [
    ["19h00 - 19h30", Time.new(2000, 1, 1, 19)],
    ["19h30 - 20h00", Time.new(2000, 1, 1, 19, 30)],
    ["20h00 - 20h30", Time.new(2000, 1, 1, 20)],
    ["20h30 - 21h00", Time.new(2000, 1, 1, 20, 30)],
    ["21h00 - 21h30", Time.new(2000, 1, 1, 21)],
    ["21h30 - 22h00", Time.new(2000, 1, 1, 21, 30)],
    ["22h00 - 22h30", Time.new(2000, 1, 1, 22)],
    ["22h30 - 23h00", Time.new(2000, 1, 1, 22, 30)]
  ]

  validates_presence_of :user, :pickup_date, :delivery_date, :pickup_time, :delivery_time
end
