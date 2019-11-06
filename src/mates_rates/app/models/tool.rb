class Tool < ApplicationRecord
  belongs_to :user
  has_many :rentals
  has_and_belongs_to_many :categories, presence: true
  has_many :renters, through: :rentals, class_name: 'User'

  validates_associated :user
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true, length: { maximum: 20 }
  validates :brand, presence: true
  # validates :model ??
  # validates :description ??
  validates :availability, inclusion: { in: [true,false] }
  validates :delivery_options, presence: true, inclusion: {in: %w[Pickup Delivery Both]}
  validates :delivery_fee, numericality: { less_than: 100 }, if: :includes_delivery
  validates :min_delivery_fee, presence: true, if: :includes_delivery

  def unavailable_dates
    rentals.pluck(:start_date, :end_date).map do |range|
      { from: range[0].to_s, to: range[1].to_s }
    end
  end

  def includes_delivery
    if :delivery_options == 'Delivery' || :delivery_options == 'Both'
      return true
    else
      return false
    end
  end

  def self.search(query)
    if query
      where("(availability = 'true') AND (name ILIKE ? OR brand ILIKE ? OR model ILIKE ?)", "%#{query}%", "%#{query}%", "%#{query}%")
    else
      # flash error
    end
  end

end
