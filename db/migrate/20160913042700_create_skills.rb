class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string     :name, null: false
      t.references :parent, references: :skills
      t.integer    :sequence, default: 0, null: false

      t.timestamps
    end

    add_index :skills, [:parent_id, :sequence], unique: true
  end
end
