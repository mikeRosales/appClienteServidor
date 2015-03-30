class AddColumnToUsersContacts < ActiveRecord::Migration
  def change
  	add_column :users_contacts, :contact_id, :int
  end
end
