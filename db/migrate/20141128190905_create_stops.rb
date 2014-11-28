class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.float :lat
      t.float :long
      t.string :route
    end
  end
end
