class AddMyColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :dateStart, :date
  end
end
