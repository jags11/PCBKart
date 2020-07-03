class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :pcb_price
      t.float :shipment_charge
      t.float :tax
      t.float :total_price
      t.string :status

      t.timestamps null: false
    end
  end
end
