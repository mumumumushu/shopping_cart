class AddOrderAddressToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_address_id, :integer
  end
end
