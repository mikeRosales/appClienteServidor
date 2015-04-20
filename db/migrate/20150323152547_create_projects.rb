class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :company
      t.string :description
      t.string :participants
      t.string :status
      t.integer :user_id
      t.date :dateStart
      t.date :dateEnd
      t.timestamps null: false
    end
  end
end
