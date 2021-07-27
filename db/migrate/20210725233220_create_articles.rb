# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.float :total_price
      t.integer :quantity

      t.timestamps
    end
  end
end
