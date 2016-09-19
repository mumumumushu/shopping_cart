class CreateCommodities < ActiveRecord::Migration[5.0]
  def change
    create_table :commodities do |t|
      t.string :c_name
      t.integer :c_num
      t.float :c_price

      t.timestamps
    end
  end
end
