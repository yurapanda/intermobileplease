class RemoveAddressOnUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :address
  end
end
