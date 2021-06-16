class AddPgTrgmExtensionToDb < ActiveRecord::Migration[6.0]
  def change
    if ActiveRecord::Base::connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute "create extension pg_trgm;"
    end
  end
end
