# frozen_string_literal: true

class Session < ApplicationRecord
  validates :user, presence: true
  validates :password, presence: true
end
