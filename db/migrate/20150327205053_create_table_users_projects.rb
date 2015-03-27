class CreateTableUsersProjects < ActiveRecord::Migration
  def change
    create_table :table_users_projects do |t|
    	t.integer :project_id
     	t.integer :user_id

      t.timestamps null: false
    end
  end
end
