class AddIsPendingToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :is_pending, :boolean
  end
end
