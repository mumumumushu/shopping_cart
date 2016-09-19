class AddDateToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_created_at, :datetime
    add_column :orders, :order_last_edited_at, :datetime
  end
end
