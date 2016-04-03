class RemoveBooleanAndTechnicianToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :boolean
  	remove_column :users, :technician
  end
end
