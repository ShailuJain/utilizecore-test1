class AddIsDeactivatedColumnToUserTable < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_deactivated, :boolean, default: false
  end
end
