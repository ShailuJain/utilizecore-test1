class User < ApplicationRecord

	has_secure_password

	validates :name, :email, presence: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

	before_save :downcase_email

	has_one :address, dependent: :destroy
	has_many :sent_parcels, foreign_key: :sender_id, class_name: 'Parcel'
	has_many :received_parcels, foreign_key: :receiver_id, class_name: 'Parcel'

	scope :with_address, -> { includes(:address) }

	accepts_nested_attributes_for :address

	def name_with_address
		@name_with_address ||= [name, address.address_line_one, address.city, address.state, address.country, address.pincode].join('-')
	end

	private

	def downcase_email
		self.email.downcase!
	end
end
