class AddNotificationsMaskToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notifications_mask, :integer
  end
end
