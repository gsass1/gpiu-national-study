class CreateSupportRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :support_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :support_type
      t.string :custom_support_type
      t.text :message
      t.text :answer
      t.string :email
      t.integer :state, default: 0
      t.datetime :discarded_at

      t.timestamps
    end
  end
end
