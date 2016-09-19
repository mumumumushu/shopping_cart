class AddSumPriceToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :sum_price, :float
  end
end
