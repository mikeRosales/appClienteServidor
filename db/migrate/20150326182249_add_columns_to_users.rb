class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :organization, :string
  	add_column :users, :first_surname, :string
  	add_column :users, :second_surname, :string
  	add_column :users, :user_name, :string
  	

  end
end
