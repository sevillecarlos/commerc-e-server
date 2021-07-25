# frozen_string_literal: true

class AddUserToCredits < ActiveRecord::Migration[6.1]
  def change
    add_reference :credits, :user
  end
end
