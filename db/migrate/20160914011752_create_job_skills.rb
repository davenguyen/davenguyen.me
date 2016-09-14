class CreateJobSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :job_skills do |t|
      t.references :job, foreign_key: true, null: false
      t.references :skill, foreign_key: true, null: false
      t.integer    :sequence, default: 0, null: false

      t.timestamps
    end

    add_index :job_skills, [:job_id, :skill_id], unique: true
    add_index :job_skills, [:job_id, :sequence], unique: true
  end
end
