class AddSlugToCatalogs < ActiveRecord::Migration
  def change
    add_column :catalogs, :slug, :string
    add_index :catalogs, :slug, unique: true
  end
end
