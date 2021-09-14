# frozen_string_literal: true

class AddUserToReceipt < ActiveRecord::Migration[6.1]
  def change
    add_reference :receipts, :user
  end
end
