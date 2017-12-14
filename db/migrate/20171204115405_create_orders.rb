class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.integer :phone
      t.string :pay_type
      t.string :type_of_delivery
      t.timestamps
    end
  end
end
