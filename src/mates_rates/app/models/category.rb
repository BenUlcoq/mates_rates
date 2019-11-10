class Category < ApplicationRecord
  # Many to many relationship with tools.
  has_and_belongs_to_many :tools

  # Categories must have a name that is unique.
  validates :name, presence: true, uniqueness: true
end
