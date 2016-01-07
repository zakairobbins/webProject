class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :phone_number
      t.text :objective

      t.timestamps null: false
    end
  end
end
