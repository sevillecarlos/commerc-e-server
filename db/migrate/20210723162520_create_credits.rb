# frozen_string_literal: true

class CreateCredits < ActiveRecord::Migration[6.1]
  def change
    create_table :credits do |t|
      t.float :amount

      t.timestamps
    end
  end
end
