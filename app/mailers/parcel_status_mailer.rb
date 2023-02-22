class ParcelStatusMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def status_change_email
    @parcel = params[:parcel]
    @sender = @parcel.sender
    @receiver = @parcel.receiver
    @url  = 'http://localhost:3000/search'
    mail(to: @receiver.email, cc: @sender.email,  subject: 'Parcel Status Update')
  end
end
