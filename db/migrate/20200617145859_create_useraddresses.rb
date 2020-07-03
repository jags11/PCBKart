class CreateUseraddresses < ActiveRecord::Migration
  def change
    create_table :useraddresses do |t|
      t.text :address
      t.string :city
      t.string :pincode

      t.timestamps null: false
    end
  end
end
