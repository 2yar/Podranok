class Category < ApplicationRecord
  has_attached_file :image, styles: { medium: '100x100>', thumb: '50x50>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  has_many :products
  has_ancestry
  validates :name, presence: true
end
