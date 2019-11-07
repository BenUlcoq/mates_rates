class Category < ApplicationRecord
  has_and_belongs_to_many :tools

  validates :name, presence: true, uniqueness: true
end
