class AddOrderToRequest < ActiveRecord::Migration
  def change
    add_reference :requests, :order, index: true, foreign_key: true
  end
end
