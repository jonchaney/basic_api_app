class ProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories, :id => false do |t|
      t.integer :category_id
      t.integer :product_id
    end
  end
end
