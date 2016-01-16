class AddUploaderToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :file, :string
  end
end
