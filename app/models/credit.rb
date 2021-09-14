# frozen_string_literal: true

class Credit < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true
  validates :user_id, presence: true
end
