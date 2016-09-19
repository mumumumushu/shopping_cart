class RemovePirceFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :pirce, :float
    add_column :orders, :sum_price, :float
  end
end
