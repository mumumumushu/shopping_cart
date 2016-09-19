class RemoveCreatAtFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :creat_at, :datetime
  end
end
