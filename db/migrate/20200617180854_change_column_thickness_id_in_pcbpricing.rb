class ChangeColumnThicknessIdInPcbpricing < ActiveRecord::Migration
  def change
    remove_column :pcb_pricings, :thickness_id, :integer
    add_column :pcb_pricings, :layerthickness_id, :integer
  end
end
