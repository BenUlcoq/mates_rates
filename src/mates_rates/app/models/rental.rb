class Rental < ApplicationRecord
  include ApplicationHelper

  belongs_to :tool
  belongs_to :user
  validates_associated :user
  validates_associated :tool
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :delivery_option, presence: true
  validate :valid_delivery_option
  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date


def valid_delivery_option
  if tool.delivery_options.include?(delivery_option)
    return true
  else
    errors.add(:delivery_option, 'is not available for this tool.')
  end
end
  

  def calculate_fee(current_user)
    return if tool.delivery_options == 'Pickup'

    owner_address = tool.user.address.gsub(' ', '+')
    renter_address = current_user.address.gsub(' ', '+')
    requestHelper("https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=#{renter_address}&destinations=#{owner_address}&key=#{Rails.application.credentials.google_places_api_key}") do |response|
      puts response
      distance = response['rows'].first['elements'].first['distance']['value']
      self.delivery_fee = [tool.delivery_fee * distance/1000, tool.min_delivery_fee].max
    end
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, 'must be after the start date.')
    end

  end



end
