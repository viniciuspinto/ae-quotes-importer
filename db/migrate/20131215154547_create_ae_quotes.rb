class CreateAeQuotes < ActiveRecord::Migration
  def up
    create_table :ae_quotes do |t|
      t.references :stock, null: false, index: true
      t.date :date, null: false
      t.decimal :close, null: false, precision: 10, scale: 2
      t.decimal :low, null: false, precision: 10, scale: 2
      t.decimal :high, null: false, precision: 10, scale: 2
      t.decimal :open, null: false, precision: 10, scale: 2
      t.decimal :monetary_volume, null: false, precision: 20, scale: 2
      t.integer :share_volume, null: false
      t.timestamps
    end

    execute <<-SQL
      ALTER TABLE ae_quotes
        ADD CONSTRAINT fk_ae_quotes_stocks
        FOREIGN KEY (stock_id)
          REFERENCES stocks(id)
          ON DELETE CASCADE
    SQL
  end

  def down
    drop_table :ae_quotes
  end
end
