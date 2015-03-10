class RemoveSlugIndexFromProducts < ActiveRecord::Migration
  def change
    remove_index :products, :slug
  end
end
