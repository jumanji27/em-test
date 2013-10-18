class CreateDevelopmentMarker < ActiveRecord::Migration
  def change
    create_table :development_markers do |t|
      t.float :min_price
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :photo_url

      t.timestamps
    end
  end
end
