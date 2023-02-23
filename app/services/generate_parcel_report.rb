require "csv"

class GenerateParcelReport
  HEADERS = ["Tracking Id", "Sender Name", "Sender Mobile Number", "Sender Email",
             "Receiver Name", "Receiver Mobile Number", "Receiver Email",
             "Weight of Parcel", "Cost Of Parcel", "Status", "Service Type", "Payment Mode"].freeze
  REPORT_NAME = "ParcelSenderReceiverDetailsReport".freeze

  def self.call(start_time, end_time)
    report_path = Rails.public_path.join([REPORT_NAME, "-", Time.zone.now.to_s, ".csv"].join).to_s
    CSV.open(report_path, "wb") do |csv|
      csv << HEADERS
      Parcel.includes(:service_type, receiver: :address, sender: :address).where("updated_at >= ? AND updated_at <= ?", start_time, end_time).each do |parcel|
        csv << [parcel.tracking_id, parcel.sender.name, parcel.sender.address.mobile_number, parcel.sender.email,
                parcel.receiver.name, parcel.receiver.address.mobile_number, parcel.receiver.email,
                parcel.weight, parcel.cost, parcel.status, parcel.service_type.name, parcel.payment_mode]
      end
    end
    Report.create!(name: REPORT_NAME, path: report_path)
  end
end
