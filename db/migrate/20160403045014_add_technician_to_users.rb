class AddTechnicianToUsers < ActiveRecord::Migration
  def change
    add_column :users, :techincian, :boolean
  end
end
