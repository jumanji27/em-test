class CreatePropertyMarker < ActiveRecord::Migration
  def change
    create_table :property_markers do |t|
      t.float :min_price
      t.float :latitude
      t.float :longitude
      t.string :marker_type

      t.timestamps
    end
  end
end
