class Tool < ApplicationRecord

  # Tools belong to specific users.
  belongs_to :user

  # Tools can be rented out many times and therefore have many rentals.
  has_many :rentals

  # Tools belong to categories and categories contain many tools.
  has_and_belongs_to_many :categories

  # Tools have many renters based on their rentals - helper.
  has_many :renters, through: :rentals, source: :user

  # Tools can have a photo attached to them.
  has_one_attached :photo

  # Validates Tool options
  validates_associated :user
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true, length: { maximum: 20 }
  validates :brand, presence: true
  validates :photo, presence: true
  validates :availability, inclusion: { in: [true,false] }
  validates :delivery_options, presence: true, inclusion: {in: %w[Pickup Delivery Both]}
  validates :delivery_fee, presence: true, numericality: { less_than: 100 }
  validates :min_delivery_fee, presence: true

  # Method for grabbing the tool's unavailable dates.
  def unavailable_dates
    # Plucks the dates from the rentals and stores them
    rentals.pluck(:start_date, :end_date).map do |range|
      # Formats the data for flatpickr to read the unavailable dates.
      { from: range[0].to_s, to: range[1].to_s }
    end
  end

  # Method for searching tools based on queries provided by user.
  def self.search(query)
    # Check for query
    if query
      # Find all tools with a category similar to the query using ILIKE and stores.
      results1 = joins(:categories).where("categories.name ILIKE ? ", "%#{query}%")

      # Find all tools with a name, model or brand similar to the query using ILIKE and stores.
      results2 = where("(availability = 'true') AND (name ILIKE ? OR brand ILIKE ? OR model ILIKE ? )",  "%#{query}%", "%#{query}%", "%#{query}%")
      
      # Combines the values
      results = results1 + results2
      # Removes duplicates
      results.uniq!
    
      # Returns the list of tools that match the search query in some way.
      return results
    end
  end

end
