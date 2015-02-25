class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :catalog, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :catalogs
  end
end
