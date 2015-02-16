class Order < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user, :pickup_date, :delivery_date
end
