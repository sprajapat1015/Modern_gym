class Membership < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy 
  has_many :users, through: :payments, dependent: :destroy 


  validates :class_name, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :capacity, presence: true
  

  
end