class Rental < ApplicationRecord
  include ApplicationHelper

  # Rentals belong to both a tool and a user. Without one or the other there is no point to the rental.
  belongs_to :tool
  belongs_to :user

  # Validations of Rental relations
  validates_associated :user
  validates_associated :tool
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :delivery_option, presence: true
  # Validates delivery option to ensure it matches with the tool.
  validate :valid_delivery_option
  # Availability is a custom validation
  # checks that there are no rentals of this tool with overlapping dates.
  validates :start_date, :end_date, presence: true, availability: true, on: :create
  # Custom validation - self explanatory.
  validate :end_date_after_start_date

  # Method for checking if a rental is finished.
def finished
  if self.end_date < Date.today
    return true
  else
    return false
  end
end

# Validates that the delivery option selected matfhes up with the tool.
def valid_delivery_option

  # Formats 'both' for checking
  if tool.delivery_options == 'Both'
    options = ['Delivery', 'Pickup']
  end

  # Checks the delivery option against tool delivery options
  if tool.delivery_options.include?(delivery_option) || options.include?(delivery_option)
    return true
  else
    # Failed validation error.
    errors.add(:delivery_option, 'is not available for this tool.')
  end
end
  

# Delivery fee calculation
  def calculate_fee(current_user)
    # No need to calculate the fee if pickup is the only available option.
    return if tool.delivery_options == 'Pickup'

    # Grabs the addresses and formats them to be used in an API call to Google.
    owner_address = tool.user.address.gsub(' ', '+')
    renter_address = current_user.address.gsub(' ', '+')

    # Calls the requestHelper method in application helper to simulate a request to the Google static API for distance/route calculations
    requestHelper("https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=#{renter_address}&destinations=#{owner_address}&key=#{Rails.application.credentials.google_places_api_key}") do |response|
      
      # Grabs the required data out of the response
      distance = response['rows'].first['elements'].first['distance']['value']
      
      # Sets the value based on the calculation of the fee using the distance value.
      # If the distance is below the minimum delivery fee, set it to the minimum.
      self.delivery_fee = [(tool.delivery_fee * distance/1000).round(2), tool.min_delivery_fee].max
    end
  end

  private

  # Validation method for checking valid dates.
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, 'must be after the start date.')
    end
  end

end
