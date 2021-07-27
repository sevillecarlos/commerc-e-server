# frozen_string_literal: true

class AddReceiptToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :receipt
  end
end
