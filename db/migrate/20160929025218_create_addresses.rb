class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :consignee_name
      t.string :consignee_address

      t.timestamps
    end
  end
end
