module UpdateAddress
  extend ActiveSupport::Concern

  def redirect_if_address_not_updated
    if current_user.present? && !current_user.address.present?
      redirect_to new_address_path, alert: "You need to update address to access the site."
    end
  end
end
