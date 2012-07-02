class CreateOrderTable < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :client_id
      t.integer :user_id
      t.text :description
      t.datetime :created_at
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
