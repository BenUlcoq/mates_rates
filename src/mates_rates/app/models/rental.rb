class Rental < ApplicationRecord
  belongs_to :tool
  belongs_to :user
  validates_associated :user
  validates_associated :tool
  validates :start_date, :end_date, presence: true, availability: true
  validate :end_date_after_start_date

  
  
  def self.unavailable_dates
    Rental.pluck(:start_date, :end_date).map do |range|
      { from: range[0].to_s, to: range[1].to_s }
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
