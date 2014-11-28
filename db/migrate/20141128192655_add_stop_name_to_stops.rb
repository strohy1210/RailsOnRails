class AddStopNameToStops < ActiveRecord::Migration
  def change
    add_column :stops, :stop_name, :string
  end
end
