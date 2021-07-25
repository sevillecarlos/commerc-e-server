# frozen_string_literal: true

require 'bcrypt'

class User < ApplicationRecord
  # has_secure_password
  has_many  :credits
  has_many  :receipts
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
