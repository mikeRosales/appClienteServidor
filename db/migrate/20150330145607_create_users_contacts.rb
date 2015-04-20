class CreateUsersContacts < ActiveRecord::Migration
  def change
    create_table :userscontacts do |t|
    	t.integer :user_id
    	t.integer :contact_id
    end
  end
end
