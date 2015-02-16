class ChangePriceFormat < ActiveRecord::Migration
  def change
    change_column :orders, :price, :float
  end
end
