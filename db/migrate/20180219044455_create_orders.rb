class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :status, default: "waiting for delivery", null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
