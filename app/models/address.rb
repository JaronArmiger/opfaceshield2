class Address < ApplicationRecord
	belongs_to :account

	validates :street_address, presence: true, length: { maximum: 100 }
	validates :city, presence: true
	validates :state, presence: true
	validates :zipcode, presence: true, length: { is: 5 }, numericality: true
end
