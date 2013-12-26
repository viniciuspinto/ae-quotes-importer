class UniqueIndexForStocksCode < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE stocks
      ADD UNIQUE INDEX idx_unique_stocks_code (code ASC);
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE stocks
      DROP INDEX idx_unique_stocks_code;
    SQL
  end
end
