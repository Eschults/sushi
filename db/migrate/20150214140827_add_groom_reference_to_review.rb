class AddGroomReferenceToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :groom_id, :integer, references: :grooms
  end
end
