class AddCategoryIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :category_id, :intenger
    add_index :products, :category_id
  end
end
