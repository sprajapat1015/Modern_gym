class User < ApplicationRecord
  rolify
  has_one :address, dependent: :destroy 
  accepts_nested_attributes_for :address

  # has_one :payment
  has_many :memberships, dependent: :destroy 
  has_many :payments, through: :memberships, dependent: :destroy 

  has_many :enrollments, dependent: :destroy 
  has_many :courses, through: :enrollments, source: :course, dependent: :destroy 

  validates :first_name, presence: true 
  validates :last_name, presence: true 
  validates :date_of_birth, presence: true 
  validates :email, presence: true 
  validates :phone_number, presence: true 
  validates :gender, presence: true 







  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



end
