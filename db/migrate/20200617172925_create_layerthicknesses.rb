class CreateLayerthicknesses < ActiveRecord::Migration
  def change
    create_table :layerthicknesses do |t|
      t.float :thickness

      t.timestamps null: false
    end
  end
end
