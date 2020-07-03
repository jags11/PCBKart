class CreatePcbPricings < ActiveRecord::Migration
  def change
    create_table :pcb_pricings do |t|
      t.float :quantity_from
      t.float :quantity_to
      t.float :price_per_unit_sq_cm

      t.timestamps null: false
    end
  end
end
