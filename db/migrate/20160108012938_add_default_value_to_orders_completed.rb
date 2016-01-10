class AddDefaultValueToOrdersCompleted < ActiveRecord::Migration
  def change
    change_column_default :orders, :completed, false
  end
end
