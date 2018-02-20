class DropTableProductsCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :product_categories
    t.integer :category_id
    t.integer :product_id
  end
end
