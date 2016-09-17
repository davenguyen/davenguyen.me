class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :website
      t.text :description
      t.integer :project_year, null: false

      t.timestamps
    end
  end
end