class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :company
      t.string :description
      t.string :participants

      t.timestamps null: false
    end
  end
end
