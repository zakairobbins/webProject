class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.references :request, index: true, foreign_key: true
      t.string :organization
      t.string :location
      t.date :start_date
      t.date :end_date
      t.text :duties

      t.timestamps null: false
    end
  end
end
