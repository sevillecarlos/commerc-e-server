# frozen_string_literal: true

class CreateReceipts < ActiveRecord::Migration[6.1]
  def change
    create_table :receipts do |t|
      t.string :code
      t.float :total

      t.timestamps
    end
  end
end
