class Address < ApplicationRecord
	validates :address_line_one, :city, :state, :country, presence: true
	validates :mobile_number, allow_blank: true, format: { with: /\d{10}/, message: "Invalid mobile number" }

	belongs_to :user
end
