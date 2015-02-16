class RenamePriceCentsToPrice < ActiveRecord::Migration
  def change
    rename_column :orders, :price_cents, :price
  end
end
