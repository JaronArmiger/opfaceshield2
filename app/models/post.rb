class Post < ApplicationRecord
	belongs_to :user
	has_one_attached :image

	validates :content, length: { maximum: 140 }
	validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
									 message: "must be valid image format" },
					 size: { less_than: 5.megabytes,
					 		 message: "should be less than 5MB" }
end
