class AddTimezoneToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :timezone, :string, default: "UTC"
  end
end
