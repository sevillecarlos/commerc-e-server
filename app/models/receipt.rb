# frozen_string_literal: true

class Receipt < ApplicationRecord
  belongs_to :user
  has_many :articles
  validates :code, presence: true
  validates :total, presence: true
  validates :user_id, presence: true
end
