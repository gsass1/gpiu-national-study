class AddKeycloakUidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :keycloak_uid, :string
  end
end
