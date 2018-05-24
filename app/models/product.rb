class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: '100x100>', thumb: '50x50>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, presence: true

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  belongs_to :category
  
  def self.search(search)
    where("cast(name as text) LIKE ? OR cast(price as text) LIKE ?", "%#{search}%", "%#{search}%")
  end

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end
end
