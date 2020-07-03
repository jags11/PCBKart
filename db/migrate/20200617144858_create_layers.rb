class CreateLayers < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.integer :layercount

      t.timestamps null: false
    end
  end
end
