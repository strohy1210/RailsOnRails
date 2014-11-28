class CreateSubwayStops < ActiveRecord::Migration
  def change
    create_table :subway_stops do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
