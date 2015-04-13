class AddMyColumn2ToProject < ActiveRecord::Migration
  def change
    add_column :projects, :dateEnd, :date
  end
end
