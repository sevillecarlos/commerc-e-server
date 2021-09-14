# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :receipt
  validates :name, presence: true
  validates :total_price, presence: true
  validates :quantity, presence: true
  validates :receipt_id, presence: true
end
