class AddImageToCategories < ActiveRecord::Migration[5.0]
  def self.up
    change_table :categories do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :categories, :image
  end
end
