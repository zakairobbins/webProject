class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :request, index: true, foreign_key: true
      t.string :school_name
      t.string :degree
      t.string :location
      t.string :awards
      t.date :graduation_date

      t.timestamps null: false
    end
  end
end
