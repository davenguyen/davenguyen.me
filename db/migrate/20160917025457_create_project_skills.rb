class CreateProjectSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :project_skills do |t|
      t.references :project, foreign_key: true, null: false
      t.references :skill, foreign_key: true, null: false
      t.integer    :sequence, default: 0, null: false

      t.timestamps
    end

    add_index :project_skills, [:project_id, :skill_id], unique: true
    add_index :project_skills, [:project_id, :sequence], unique: true
  end
end
