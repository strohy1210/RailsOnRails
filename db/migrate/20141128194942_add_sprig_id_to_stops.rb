class AddSprigIdToStops < ActiveRecord::Migration
  def change
    add_column :stops, :sprig_id, :integer
  end
end
