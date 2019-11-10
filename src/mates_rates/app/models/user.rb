class User < ApplicationRecord

 
  resourcify
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation for user sign-up
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  

  # Users can have many tools and rentals - without a user these aren't possible on the platform.
  has_many :tools
  has_many :rentals

  # User can rent many tools from others - helper.
  has_many :rented_tools, through: :rentals, source: :tool

  # User has many roles and many users can have the same role.
  has_and_belongs_to_many :roles, :join_table => :users_roles

end
