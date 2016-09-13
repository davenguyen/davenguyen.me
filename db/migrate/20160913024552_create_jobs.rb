class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :company_name, null: false
      t.string :company_website
      t.string :title, null: false
      t.text :description
      t.date :start_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
