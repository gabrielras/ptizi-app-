# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :imei
      t.float :annual_price, precision: 10, scale: 2
      t.string :device_model
      t.integer :installments

      t.timestamps
    end

    add_index :orders, :imei, unique: true
  end
end
