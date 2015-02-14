class AddOrderReferenceToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :order_id, :integer, references: :orders
  end
end
