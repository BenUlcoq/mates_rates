class User < ApplicationRecord

 
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  

  has_many :tools
  has_many :rentals
  has_many :rented_tools, through: :rentals, source: :tool
  has_and_belongs_to_many :roles, :join_table => :users_roles

end
