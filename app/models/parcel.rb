class Parcel < ApplicationRecord

	STATUS = ['Sent', 'In Transit', 'Delivered']
	PAYMENT_MODE = ['COD', 'Prepaid']

	validates :weight, :status, :cost, presence: true
	validates :weight, :cost, :numericality => { :greater_than => 0 }
	validates :status, inclusion: STATUS
	validates :payment_mode, inclusion: PAYMENT_MODE
	validates :tracking_id, uniqueness: true, presence: true
	validate :sender_and_receiver_not_same

	belongs_to :service_type
	belongs_to :sender, class_name: 'User'
	belongs_to :receiver, class_name: 'User'

	before_validation :generate_tracking_id, on: :create
	after_create :send_notification
	after_save :send_status_change_notification

	def sender_and_receiver_not_same
		if sender_id == receiver_id
			errors.add(:sender_id, "Sender and Receiver cannot be same")
			errors.add(:receiver_id, "Sender and Receiver cannot be same")
		end
	end

	private

	def send_notification
		UserMailer.with(parcel: self).status_email.deliver_later
	end

	# adding self.reload so that the mailer will always get the updated object
	def send_status_change_notification
		ParcelStatusMailer.with(parcel: self).status_change_email.deliver_later if saved_change_to_status?
	end

	# this does not make sure it will always be unique, we will need to make sure. currently skipping
	def generate_tracking_id
		self.tracking_id = SecureRandom.hex
	end

end
