class User < ApplicationRecord
  after_create :assign_default_role

  def assign_default_role
    add_role(:renter) if roles.blank?
  end

  
  resourcify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  

  has_many :tools
  has_many :rentals
  has_many :rented_tools, through: :rentals, class_name: 'Tool'

  rolify
  # has_and_belongs_to_many :roles
end
