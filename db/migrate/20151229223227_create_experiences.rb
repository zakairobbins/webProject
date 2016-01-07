class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :request, index: true, foreign_key: true
      t.string :company
      t.string :location
      t.date :start_date
      t.date :end_date
      t.string :job_title
      t.text :responsibilities
      t.text :awards

      t.timestamps null: false
    end
  end
end
