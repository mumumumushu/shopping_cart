class AddOrderReferencesToCommodities < ActiveRecord::Migration[5.0]
  def change
    add_reference :commodities, :order, foreign_key: true
  end
end
