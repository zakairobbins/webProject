class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :request, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
