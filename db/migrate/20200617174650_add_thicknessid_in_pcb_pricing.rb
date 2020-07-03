class AddThicknessidInPcbPricing < ActiveRecord::Migration
  def change
    add_column :pcb_pricings, :thickness_id, :integer
  end
end
