class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :completed
      t.timestamps null: false
    end
  end
end
