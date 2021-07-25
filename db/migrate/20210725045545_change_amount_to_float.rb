class ChangeAmountToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :credits, :amount, :float
  end
end
