class AddTrackingIdToParcels < ActiveRecord::Migration[6.1]
  def change
    add_column :parcels, :tracking_id, :string, null: false, unique: true
  end
end
