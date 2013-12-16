class CreateStocks < ActiveRecord::Migration
  def up
    create_table :stocks do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.timestamps
    end
  end

  def down
    drop_table :stocks
  end
end
