class Review < ActiveRecord::Base
  belongs_to :groom
  belongs_to :order

  validates_presence_of :order, :groom
end
