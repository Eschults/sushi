class AddAddressDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :address_details, :text
  end
end
