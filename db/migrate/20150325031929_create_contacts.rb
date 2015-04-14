class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :contact_id 
      t.string :name
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
