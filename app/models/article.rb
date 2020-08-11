class Article < ApplicationRecord
  validates :url, presence: true
  validates :title, presence: true
  validates :img_src, presence: true
end
