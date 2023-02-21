class Parcel < ApplicationRecord

	STATUS = ['Sent', 'In Transit', 'Delivered']
	PAYMENT_MODE = ['COD', 'Prepaid']

	validates :weight, :status, :cost, presence: true
	validates :weight, :cost, :numericality => { :greater_than => 0 }
	validates :status, inclusion: STATUS
	validates :payment_mode, inclusion: PAYMENT_MODE
	validate :sender_and_receiver_not_same

	belongs_to :service_type
	belongs_to :sender, class_name: 'User'
	belongs_to :receiver, class_name: 'User'

	after_create :send_notification

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

end
