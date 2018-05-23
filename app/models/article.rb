class Article < ApplicationRecord
  has_attached_file :image, styles: { medium: '400x400>', thumb: '50x50>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
