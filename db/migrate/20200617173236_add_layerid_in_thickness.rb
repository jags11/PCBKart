class AddLayeridInThickness < ActiveRecord::Migration
  def change
    add_column :layerthicknesses, :layer_id, :integer
  end
end
