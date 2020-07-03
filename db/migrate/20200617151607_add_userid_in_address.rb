class AddUseridInAddress < ActiveRecord::Migration
  def change
    add_column :useraddresses, :user_id, :integer
  end
end
