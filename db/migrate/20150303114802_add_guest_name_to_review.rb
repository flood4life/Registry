class AddGuestNameToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :guest_name, :string
  end
end
