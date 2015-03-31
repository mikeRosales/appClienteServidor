class AddColumns < ActiveRecord::Migration
  def change
  	add_column :projects, :status, :string
  	add_column :activities, :project_id, :integer
  end
end
