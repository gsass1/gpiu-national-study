class AddPgTrgmExtensionToDb < ActiveRecord::Migration[6.0]
  def change
    if defined?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter) && ActiveRecord::Base::connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
      execute "create extension pg_trgm;"
    end
  end
end
