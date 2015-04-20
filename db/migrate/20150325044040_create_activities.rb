class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :activity_name
      t.date :start_date
      t.date :end_date
      t.string :responsibles
      t.string :status
      t.string :project_id


      t.timestamps null: false
    end
  end
end
