class ChangeDefaultIsPendingToReview < ActiveRecord::Migration
  def change
    change_column_default :reviews, :is_pending, false
  end
end
