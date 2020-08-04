class Order < ApplicationRecord
	# associations
	belongs_to :account

	#validations
	validates :num_shields, presence: true,
							numericality: { only_integer: true,
											less_than_or_equal_to: 999 }
	validates :num_adjusters, presence: true,
							  numericality: { only_integer: true,
											less_than_or_equal_to: 999 }
	validates :message, presence: true, length: { maximum: 140 }
	validates :street_address, presence: true, length: { maximum: 100 }
	validates :city, presence: true
	validates :state, presence: true
	validates :zipcode, presence: true, length: { is: 5 }, numericality: true

	def process
	  self.processed = true
	  save!
	end

	def unprocess
	  self.processed = false
	  save!
	end
end
