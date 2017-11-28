class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: '100x100>', thumb: '50x50>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :price,  numericality: { greater_than: 0, allow_nil: true } 
  validates :name, presence: true
end
