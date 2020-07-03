class AddThicknessUserAddressInOrder < ActiveRecord::Migration
  def change
    add_column :orders, :pcb_pricing_id, :integer
    add_column :orders, :useraddress_id, :integer
    add_column :orders, :user_id, :integer
  end
end
